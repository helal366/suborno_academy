## Step 1: Add Credentials to .envEnsure these configurations exist in your root environment file:
env
```
SMS_BD_API_KEY=your_actual_sms_bd_api_key
SMS_BD_SENDER_ID=8801700000000
SMS_BD_API_URL=https://api.sms.bd
```
## Step 2: The Provider Code (export)Create a dedicated file for your service. Native fetch requires you to stringify the body and explicitly run .json() to parse the data.
```
// src/services/sms.service.ts

interface ISmsPayload {
  api_key: string;
  msg: string;
  to: string;
  senderid?: string;
}

interface ISmsResponse {
  success: boolean;
  message?: string;
  data?: any;
  error?: string;
}

export class SmsBdProvider {
  private static API_KEY = process.env.SMS_BD_API_KEY || '';
  private static SENDER_ID = process.env.SMS_BD_SENDER_ID || '';
  private static BASE_URL = process.env.SMS_BD_API_URL || 'https://api.sms.bd';

  /**
   * Helper to normalize Bangladeshi phone numbers to 880XXXXXXXXXX format
   */
  private static formatPhoneNumber(phone: string): string {
    let clean = phone.replace(/[+\s-]/g, '');
    if (clean.startsWith('01')) {
      clean = `88${clean}`;
    }
    return clean;
  }

  /**
   * Sends an SMS using Node's native Fetch API
   */
  public static async sendSms(receiverPhone: string, textMessage: string): Promise<ISmsResponse> {
    if (!this.API_KEY) {
      throw new Error('[sms.bd] Missing API Key in backend configuration.');
    }

    const formattedTo = this.formatPhoneNumber(receiverPhone);

    const payload: ISmsPayload = {
      api_key: this.API_KEY,
      msg: textMessage,
      to: formattedTo,
    };

    if (this.SENDER_ID) {
      payload.senderid = this.SENDER_ID;
    }

    try {
      // Executing request with native fetch
      const response = await fetch(this.BASE_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: JSON.stringify(payload), // Manual serialization required for fetch
      });

      // Unpack response stream to JSON
      const responseData = await response.json();

      if (!response.ok) {
        throw new Error(responseData.message || `HTTP error! status: ${response.status}`);
      }

      console.log(`[sms.bd Success] Dispatched to ${formattedTo}`);
      return {
        success: true,
        data: responseData,
      };

    } catch (error: any) {
      console.error(`[sms.bd Failure] Failed targeting ${formattedTo}:`, error.message);
      return {
        success: false,
        error: error.message || 'Internal connection error',
      };
    }
  }
}

```

## Step 3: Triggering the Service (import)Import the module directly into your Admin controller or registration router logic.

```
// src/controllers/student.controller.ts
import { Request, Response } from 'express';
import { SmsBdProvider } from '../services/sms.service'; // Adjust path based on your folder structure

export const createStudentAccount = async (req: Request, res: Response) => {
  try {
    const { studentName, phone } = req.body;
    
    // 1. Core database creation logic here (Prisma, etc.)
    const generatedUsername = `std_${phone.slice(-5)}`;
    const temporaryPassword = `Pass_${Math.floor(1000 + Math.random() * 9000)}`;

    const textMessage = `Assalamu Alaikum ${studentName},\nYour school profile is setup.\nUser: ${generatedUsername}\nPass: ${temporaryPassword}`;

    // 2. Import and trigger native fetch provider
    const smsResult = await SmsBdProvider.sendSms(phone, textMessage);

    if (!smsResult.success) {
      // Log to database or Redis failure queue for manual retry
      console.warn(`[SMS Alert] Text could not reach student: ${smsResult.error}`);
    }

    return res.status(201).json({
      success: true,
      message: 'Student account provisioned successfully.',
      smsStatus: smsResult.success ? 'Delivered' : 'Failed to send text'
    });

  } catch (error) {
    return res.status(500).json({ success: false, message: 'Server error during setup' });
  }
};

```

## sms.bd
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://api.sms.net.bd/sendsms',
  formData: {
    'api_key': 'YOUR_API_KEY',
    'msg': 'Test',
    'to': '8801800000000'
  }
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});