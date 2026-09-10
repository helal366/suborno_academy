- [Installation](#Installation)
- [API Routes](#api_routes)
## api_routes
### auth routes:
* login route: /api/v1/smps/auth/login
* registration route: /api/v1/smps/auth/registration

## Teacher honourable responsibilities:
* A teacher may have some honourable responsibilities like SUBJECT_TEACHER, RESPONSIBLE_TEACHER, GRADE_TEACHER, GROUP_TEACHER
* A teacher who will assign as a SUBJECT_TEACHER, will assign not for a single class rather will assign for the whole school for that subject.
* A teacher will assign as a RESPONSIBLE_TEACHER for maximum 10 students.
* GRADE_TEACHER for PLAYGROUP AND NURSERY
* GROUP_TEACHER for other classes.
* GRADE_TEACHER or GROUP_TEACHER are like class teachers.
* if a teacher is assign for GRADE_TEACHER for a class, then he/she will not assign as GRADE_TEACHER or GROUP_TEACHER for any other class. uniquely assign.
* if a teacher is assign for GROUP_TEACHER for a class, then he/she will not assign as GRADE_TEACHER or GROUP_TEACHER for any other class. uniquely assign.
* A teacher may assign as SUBJECT_TEACHER, RESPONSIBLE_TEACHER and GROUP_TEACHER at a time.
* A teacher may assign as SUBJECT_TEACHER, RESPONSIBLE_TEACHER and GRADE_TEACHER at a time.
* A teacher will NOT assign as SUBJECT_TEACHER, RESPONSIBLE_TEACHER and GRADE_TEACHER and GROUP_TEACHER at a time.

## Class routine:
- Normal rule:
* A teacher will not be able to take two class in a single period.
* Each student will be able to see their own class routine.
* Each teacher will be able to see their own class routine.
* Each GRADE and GROUP teacher will be able to see the specific class's class routine which class's GRADE TEACHER or GROUP TEACHER he/she is.
* ADMIN and SUPER_ADMIN can see any class's class routine and any teacher's class routine.
* HIFZ teacher can see the NURANI and NAZERA teachers' class routine with his own class routine.

## Hifz Nazera Class:
*  Hifz and Nazera class separation depends on the students number. If the number of students is low then the authority will continue Hifz and Nazera in one class. But if number increase then the authority will separate the Hifz and Nazera class.
* Hifz teacher will have the access of Nazera and Nurani teacher's class routine access.
* Always there will be two teachers for Hifz and Nazera whether the class is combined or the classes are separate.

## Class scheduling/timimg:
**SPECIAL PERIODS: **
1. NURANI_MORNING: 07:00 to 08:00
2. NAZERA_MORNING: 06:00 to 08:00
3. HIFZ_MORNING: 06:00 to 08:00
4. NURANI_EVENING: 15:00 to 17:00
5. NAZERA_EVENING: 15:00 to 17:00
6. HIFZ_EVENING: 15:00 to 17:00
7. NAZERA_NIGHT: AFTER MAGRIB to 20:00
8. HIFZ_NIGHT: AFTER MAGRIB to 20:00
9. NURANI_GIRLS: 09:45 to 10:30
10. NAZERA_GIRLS: 08:00 to 10:30
11. HIFZ_GIRLS: 08:00 to 10:30

**NURANI SUBJECTS**
1. NURANI_PRELIMINARY
2. NURANI_ADVANCE
3. NURANI_AMPARA

**HIFZ_NAZERA SUBJECTS**
1. HIFZ
2. NAZERA

**SHIFTS: **
1. MORNING             For PLAYGROUP, NURSERY, KG, GRADE_ONE and GRADE_TWO
2. DAY                 For PLAYGROUP, NURSERY, KG, GRADE_ONE and GRADE_TWO
3. BOYS                For GRADE_SIX to GRADE_TEN
4. GIRLS               For GRADE_SIX to GRADE_TEN

**CLASS SCHEDULING/TIMING: **
* PLAYGROUP with MORNING BRANCH: 08:00 to 10:30
* PLAYGROUP with DAY BRANCH: 10:45 AM to 13:00 
* NURSERY with MORNING BRANCH: 
    \- 08:00 to 10:15 and NURANI_MORNING and NURANI_EVENING (optional)--->(Nurani/Ampara)
    \- 08:00 to 10:15 and HIFZ_MORNING and HIFZ_EVENING (optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)
    
* NURSERY with DAY BRANCH:
    \- 10:30 to 13:00 (only school)
    \- 10:30 to 13:00 and NURANI_MORNING (optional) and NURANI_EVENING (optional) --->(Nurani/Ampara)
    \- 10:30 to 13:00 and HIFZ_MORNING(optional) and HIFZ_EVENING(optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)

* KG, GRADE_ONE, GRADE_TWO with MORNING BRANCH: 
    \- 08:00 to 10:30 and NURANI_MORNING and NURANI_EVENING(optional)--->(Nurani/Ampara)
    \- 08:00 to 10:30 and HIFZ_MORNING and HIFZ_EVENING (optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)

* KG, GRADE_ONE, GRADE_TWO with DAY BRANCH:
    \- 09:45 to 13:00 
    \- 09:45 to 13:00 and NURANI_MORNING (optional) and NURANI_EVENING(optional)--->(Nurani/Ampara)
    \- 09:45 to 13:00 and HIFZ_MORNING(optional) and HIFZ_EVENING (optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)

* GRADE_THREE, GRADE_FOUR and GRADE_FIVE with BOYS BRANCH: 
    \-  NURANI_MORNING and 08:00 to 11:30 and NURANI_EVENING (optional)--->(Nurani/Ampara)
    \-  HIFZ_MORNING and 08:00 tp 11:30 and HIFZ_EVENING(optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)
* GRADE_THREE, GRADE_FOUR and GRADE_FIVE with GIRLS BRANCH:
    \- NURANI_GIRLS and 10:30 to 14:20 and NURANI_EVENING(optional)--->(Nurani/Ampara)
    \- HIFZ_GIRLS and 10:30 to 14:20 and HIFZ_EVENING(optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)

* GRADE_SIX to GRADE_TEN with BOYS BRANCH:
    \- NURANI_MORNING and 08:00 to 12:30 and NURANI_EVENING(optional)--->(Nurani/Ampara)
    \- HIFZ_MORNING and 08:00 tp 12:30 and HIFZ_EVENING(optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)

* GRADE_SIX to GRADE_TEN with GIRLS BRANCH:
    \- NURANI_GIRLS and 10:30 to 14:50 and NURANI_EVENING (optional)--->(Nurani/Ampara)
    \- HIFZ_GIRLS and 10:30 to 14:20 and HIFZ_EVENING (optional) and HIFZ_NIGHT(optional) --->(Hifz/Nazera)

## Responsible teacher:
1. A student will only have one responsible teacher at a time.
2. A teacher will have more than one responsible teacher at a time.
3. Principal sir will decide, how many students' responsibility a teacher will take. Primarily, a teacher can take upto 10(ten) students' responsibility.

## Roles: 
SUPER_ADMIN
TEACHER_ADMIN
ADMIN
TEACHER
MANAGEMENT
ACADEMIC
STUDENT 
GOVERNING_BODY

## Positions:
PRINCIPAL
VICE_PRINCIPAL
ADMINISTRATIVE_INCHARGE
ACADEMIC_INCHARGE
LOGISTIC_OFFICER
ACADEMIC_STAFF
MANAGEMENT_STAFF
TEACHER
ASSISTANT_TEACHER
TEACHER_ASSISTANT
CO-ORDINATOR
ACCOUNTANT
STUDENT
GOVERNING_BODY
AAYA
GUARD
CLEANER

## Internal relations between Roles and Positions:
* SUPER_ADMIN: PRINCIPAL
* TEACHER_ADMIN: VICE_PRINCIPAL, ADMINISTRATIVE_INCHARGE, ACADEMIC_INCHARGE
* ADMIN: LOGISTIC_OFFICER, CO_ORDINATOR, ACCOUNTANT
* TEACHER: TEACHER, ASSISTANT_TEACHER, TEACHER_ASSISTANT
* ACADEMIC: ACADEMIC_STAFF
* MANAGEMENT: AAYA, GUARD, CLEANER, SISTER, MANAGEMENT_STAFF 
* STUDENT: STUDENT
* GOVERNING_BODY: GOVERNING_BODY

## Classes:
PLAYGROUP
NURSERY
KINDERGARTEN
GRADE_ONE_ENGLISH
GRADE_ONE_BANGLA
GRADE_TWO_ENGLISH
GRADE_TWO_BANGLA
GRADE_THREE_BANGLA
GRADE_FOUR_BANGLA
GRADE_FIVE_BANGLA
GRADE_SIX_BANGLA
GRADE_SEVEN_BANGLA
GRADE_EIGHT_BANGLA
GRADE_NINE_BANGLA
GRADE_TEN_BANGLA

## Shifts:
MORNING   (madrasha)
DAY   (school)
BOYS
GIRLS

## Connection between Class and Branch:
PLAYGROUP, NURSERY, KG, GRADE_ONE, GRADE_TWO ---> MORNING and DAY
OTHER CLASSES ---> BOYS and GIRLS

## Honourable responsibilities for teachers:
SUBJECT_TEACHER
GROUP_TEACHER
GRADE_TEACHER
RESPONSIBLE_TEACHER

## Nurani curriculum for different classes:
NURANI_PLAYGROUP: ARABIC ALPHABET
NURANI_NURSERY: ARABIC WORD MAKING
NURANI_PRELIMINARY: কায়েদা শুরু থেকে মাদ্দ অধ্যায় পর্যন্ত
NURANI_ADVANCE: হরকত অধ্যায় থেকে শেষ পর্যন্ত
NURANI_AMPARA: শুরু থেকে শেষ পর্যন্ত

## Class scheduling/timimg:
**SPECIAL PERIODS: **
1. NURANI_MORNING: 07:00 to 08:00
2. NAZERA_MORNING: 06:00 to 08:00
3. HIFZ_MORNING: 06:00 to 08:00
4. NURANI_EVENING: 15:00 to 17:00
5. NAZERA_EVENING: 15:00 to 17:00
6. HIFZ_EVENING: 15:00 to 17:00
7. NAZERA_NIGHT: AFTER MAGRIB to 20:00
8. HIFZ_NIGHT: AFTER MAGRIB to 20:00
9. NURANI_GIRLS: 09:45 to 10:30
10. NAZERA_GIRLS: 08:00 to 10:30
11. HIFZ_GIRLS: 08:00 to 10:30

**SHIFTS: **
1. MORNING             For PLAYGROUP, NURSERY, KG, GRADE_ONE and GRADE_TWO
2. DAY                 For PLAYGROUP, NURSERY, KG, GRADE_ONE and GRADE_TWO
3. BOYS                For GRADE_SIX to GRADE_TEN
4. GIRLS               For GRADE_SIX to GRADE_TEN

## Extra curriculum activities:

### Cultural club:
* সংগীত
* অভিনয়
* বিতর্ক
* আবৃতি
* বক্তৃতা
* উপস্থাপনা
* art
* দেয়াল লিখন (caligraphy)

### Quran club:
* কেরাত
* after school maktab
* senior citizen quran learning

### Language club:
* Spoken english
* Spoken arabic
* Phoenetics
* Reading (Presentation)
* Cursive writing 
* শুদ্ধ বাংলা উচ্চারণ

### Science club:
* ক্ষুদে বিজ্ঞানী (with project)
* ক্ষুদে ডাক্তার (with project)
* Basic computer learning
* Robotics
* Basic IT with basic AI

### Scout and sports club:
* PT Parade (শারীরিক শিক্ষা কুচকাওয়াজ বা শারীরিক কসরত প্রদর্শনী।)
* Martial arts/Karate
* Swimming

# Installation

- create .gitignore file and write
  node_modules
  dist
  .env
- command

```
pnpm init
pnpm add typescript tsx @types/node --save-dev
pnpm approve-builds
<!-- pnpm install -->
pnpm exec tsc --init
pnpm add @prisma/client
pnpm add -D prisma
pnpm approve-builds
pnpm add @prisma/adapter-pg
pnpm add -D @types/ws
<!-- pnpm install -->
pnpm add pg dotenv
pnpm add  --save-dev @types/pg -D @types/dotenv
```

#### package.json add:
```
  "type":"module",
```
* package.json scripts part:
```
"scripts": {
    "dev": "tsx watch src/server.ts",
    "build": "tsc",
    "postinstall": "prisma generate",
    "vercel-build": "prisma generate && prisma migrate deploy && tsc",
    "db:migrate": "prisma migrate dev",
    "db:studio": "prisma studio"
  },
```
* before scripts into package.json:
```
"main": "dist/server.js",
  "imports": {
    "#db-client": {
      "default": "./dist/generated/client/client.js"
    }
  },
```

#### tsconfig.json
- replace tsconfig.json with the following code:
```
{
  "compilerOptions": {
    "rootDir": "./", // Change from "./src" to "./" to support root config files
    "outDir": "./dist",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "target": "ES2023",
    "types": ["node", "express", "cookie-parser", "cors", "jsonwebtoken"],
    "sourceMap": true,
    "declaration": true,
    "declarationMap": true,
    "noUncheckedIndexedAccess": true,
    "strict": true,
    "isolatedModules": true,
    "noUncheckedSideEffectImports": true,
    "moduleDetection": "force",
    "skipLibCheck": true,
    "paths": {
      "#db-client": ["./src/generated/client/client.ts"] // Adjusted path mapping
    }
  },
  "include": ["src/**/*", "prisma.config.ts"], // Include prisma.config.ts here
  "exclude": ["node_modules", "prisma/generated"] // Remove prisma.config.ts from here
}
```

#### prisma 
- then the following commands:

```
pnpm dlx prisma
pnpm approve-builds
pnpm dlx prisma init --output ../generated/prisma
```

#### package installation with type dependencies:
- now install express, bcryptjs, cors, cookie parser, http status code, jwt and their type dependencies
  bcryptjs has its own type installation with it. so bcryptjs has no need to install it's type
```
pnpm add express bcryptjs cors cookie-parser http-status-codes jsonwebtoken ms 
pnpm add -D shx @types/express @types/cors @types/cookie-parser @types/jsonwebtoken
```

- create src and dist folder at the root directory

#### config folder and index.ts file:
- config/index.ts setup: create a config folder into src folder and a index.ts file into config folder.

```
import dotenv from "dotenv";
dotenv.config();
interface EnvVariables{
    PORT: string,
    DATABASE_URL: string,
    NODE_ENV: "development" | "production",
    JWT_ACCESS_SECRET:string,
    JWT_ACCESS_EXPIRES:string,
    JWT_REFRESH_SECRET:string,
    JWT_REFRESH_EXPIRES:string,
    BCRYPT_SALT_ROUND:string,
    APP_LOCAL_URL:string,
}
const loadEnvVariables=():EnvVariables=> {
    const envVars:string[] = ["PORT", "DATABASE_URL", "NODE_ENV", "JWT_ACCESS_SECRET", "JWT_ACCESS_EXPIRES", "BCRYPT_SALT_ROUND",  "JWT_REFRESH_SECRET", "JWT_REFRESH_EXPIRES", "APP_LOCAL_URL"];
    envVars.forEach(element=>{
        if(!process.env[element]){
            throw new Error(`Required environmental variable missing: ${element}`)
        }
    })
    return {
    PORT : process.env.PORT as string,
    DATABASE_URL : process.env.DATABASE_URL as string,
    NODE_ENV: process.env.NODE_ENV as "development" | "production",
    JWT_ACCESS_SECRET: process.env.JWT_ACCESS_SECRET as string,
    JWT_ACCESS_EXPIRES: process.env.JWT_ACCESS_EXPIRES as string,
    JWT_REFRESH_SECRET:process.env.JWT_REFRESH_SECRET as string,
    JWT_REFRESH_EXPIRES:process.env.JWT_REFRESH_EXPIRES as string,
    BCRYPT_SALT_ROUND: process.env.BCRYPT_SALT_ROUND as string,
    APP_LOCAL_URL: process.env.APP_LOCAL_URL as string,
}
}
export const envVars = loadEnvVariables();
```

#### generate prisma
```
 pnpm postinstall
```

#### prisma.ts, db connection:

* create a folder named "lib" into src. then create a file named prisma.ts
* into the prisma.ts file add the following code:

```
import 'dotenv/config';
import pg from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient } from '#db-client';

type CustomPrismaClient = InstanceType<typeof PrismaClient>;

const globalForPrisma = globalThis as unknown as {
  prisma: CustomPrismaClient | undefined;
};

// Initialize the native PostgreSQL pool over standard TCP
const pool = new pg.Pool({ connectionString: process.env["NEON_DB_LINK_DIRECT"] });
const adapter = new PrismaPg(pool);

// Pass the adapter directly into the options object
export const prisma =
  globalForPrisma.prisma ??
  new PrismaClient({ adapter });

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma;
}
```

- create your own database add DATABASE_URL at .env

* prisma.config.ts: create a folder named schema into prisma folder
```
import "dotenv/config";
import { defineConfig } from "prisma/config";

export default defineConfig({
  schema: "prisma/schema",
  migrations: {
    path: "prisma/migrations",
  },
  datasource: {
    url: process.env["NEON_DB_LINK_DIRECT"], // Add this line here
  },
});

```
#### express setup
* app.ts
```
import cookieParser from "cookie-parser";
import express, { Application, Request, Response } from "express";
import cors from "cors";
import { envVars } from "./config/index.js";

const app:Application = express();
app.use(cors())
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(cookieParser())
app.get("/", (req:Request,res:Response)=>{
    res.send("This is prisma press backend server. Please use the API endpoints to interact with the server.")
})
export default app;
```

#### server.ts

```
import app from "./app.js";
import { envVars } from "./config/index.js";
import { prisma } from "./lib/prisma.js";

async function connectDB() {
  try {
    await prisma.$connect();
    console.log("Connected to the database successfully.");
  } catch (error) {
    console.error("Error starting server:", error);
  }
}
connectDB();

if (envVars.NODE_ENV !== "production") {
  const PORT = envVars.PORT || 5000;
  const server = app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });

  server.on("error", (err) => {
    console.error("Server failed to start:", err);
  });
}

export default app;
```

### deployment in vercel

- create vercel.json file in the root directory. write the following code.

```
{
  "version": 2,
  "builds": [
    {
      "src": "src/server.ts",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "src/server.ts"
    }
  ]
}
```

- then go to terminal and run the following command:

```
pnpm build
```

- globally install vercel: (alrready done, do not need for next projects)

```
pnpm add -g vercel
pnpm approve-builds -g
```

- then login to vercel:

```
vercel login
```

- then start to deploy in vercel. write the following command in vercel

```
vercel
```

step by step answer the appeared questions

- add the following code at package.json into scripts

```
 "deploy": "pnpm build && vercel --prod"
```

- now go to vercel and add the env variables.


#### pnpm-workspace.yaml
* go to pnpm-workspace.yaml file and replace everything with the following code:

```
packages:
  - .

allowBuilds:
  '@prisma/engines': true
  esbuild: true
  prisma: true
```


### vercel rebind
```
vercel login
vercel link
vercel env pull .env.production.local

export ENABLE_EXPERIMENTAL_COREPACK=1
vercel --prod --force

```

#### SSLCOMMERZ
* Payment gateway
* View Docs
* Create SandBox
* Store the given informations ent to your email
* Go to Merchant url
* Login

* Initiate Payment
* install sslcommerz
```
pnpm add sslcommerz-lts
pnpm add --save-dev @types/sslcommerz-lts
```


### stripe payment

- Stripe payment

* Sign up/Login first
* Go to Stripe docs from Developer tab
* Get started with Stripe
* Sell subscription as SaaS start-up
* Create a test product and price
* Click on the option: Create a test product in the dashboard

-> Another way:

- Go to Dashboard
- Product Catalog
- Create product

---

Now create product

- Fill up name and description
- Pricing Model : Standard pricing
- Price in BDT (should select this currency)
- According to project : Recurring or One Time (One Time for now)






## Primary installation

### npm init --y
### npm i -D typescript
### npx tsc --init

### npm install -D @types/node

### npm i express
### npm i --save-dev @types/express

### tsconfig.js:
* uncomment: 
"rootDir": "./src",
"outDir": "./dist",
"lib": ["esnext"],
"types": ["node"],

* comment:
// "types": [],
// "jsx": "react-jsx",

* create src folder and into it create server.ts

### npm i -D tsx
### package.json file: 
* into scripts, add: "dev": "tsx watch ./src/server.ts",

* at package.json add: "type":"module",

### npm i pg
### npm i --save-dev @types/pg

### npm install dotenv
### npm install -D @types/dotenv

### npm i jsonwebtoken
### npm i -D npm i @types/jsonwebtoken

### npm i http-status-codes

### npm i cookie-parser
### npm i -D @types/cookie-parser

### npm i cors
### npm i -D @types/cors

### create .gitignore and into it add:
*  .env, dist, node_modules
### at package.json into scripts add:
* "build":"tsc",


## vercel 
### check vercel is globally installed or not : 
* vercel --version
* if not then install globally
###  npm install -g vercel (globally installed)