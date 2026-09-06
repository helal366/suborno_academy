// src/utils/validateMobile.ts
import { AppError } from "../../utils/appError.js";
import { StatusCodes } from "http-status-codes";

/**
 * Validates that a mobile number starts with 0, 
 * has either 1 or 9 as the second digit,
 * and is exactly 11 digits long.
 */
export const validateStrictBDMobile = (mobileNumber: string): string => {
  // 1. Remove accidental spaces, dashes, or parentheses
  const cleanNumber = mobileNumber.replace(/[\s\-\(\)]/g, "");

  // 2. Strict Regex Check:
  // ^0        -> 1st digit must be 0
  // [19]      -> 2nd digit must be 1 or 9
  // \d{9}$    -> Followed by exactly 9 more digits to total exactly 11 digits
  const strictRegex = /^0[19]\d{9}$/;

  if (!strictRegex.test(cleanNumber)) {
    throw new AppError(
      "Invalid mobile number format. Number must start with 0, have 1 or 9 as the second digit, and contain exactly 11 digits.",
      StatusCodes.BAD_REQUEST
    );
  }

  return cleanNumber;
};
