import { ActiveStatus, BloodGroup, Gender, Religion } from "#db-client";

export interface ICreateUserRequest {
  // Required Core Fields
  full_name: string;
  mobile_number: string;
  role_name?: string; // Refers to the Role model key
  position_name: string; // Refers to your dynamic Position model key
  gender: Gender;

  // Optional Demographic & Health Data
  blood_group?: BloodGroup | null;
  date_of_birth?: Date | string | null; // Accepts string from JSON body payloads, parsed to Date in backend
  heightInCm?: number | null;
  weightInKg?: number | null;
  religion?: Religion | null;
  nationality?: string | null;

  // Optional Identity Documents
  birth_certificate_number?: string | null;
  nid_number?: string | null;

  // Optional Family Background
  father_name?: string | null;
  mother_name?: string | null;

  // Optional System Authentication Fields
  active_status?: ActiveStatus;
  email?: string | null;
  user_name?: string | null;
  user_password?: string;
}

export interface IUpdateUserRequest {
  // Core Fields (Optional on Update, but cannot be set to null)
  full_name?: string;
  mobile_number?: string;
  role_name?: string;
  position_name?: string;
  gender?: Gender;

  // Modifiable Demographic & Health Data (Can be updated or cleared with null)
  blood_group?: BloodGroup | null;
  date_of_birth?: Date | string | null;
  heightInCm?: number | null;
  weightInKg?: number | null;
  religion?: Religion | null;
  nationality?: string | null;

  // Identity Documents (Can be added later or modified)
  birth_certificate_number?: string | null;
  nid_number?: string | null;

  // Family Background
  father_name?: string | null;
  mother_name?: string | null;

  // System & Authentication (Optional)
  active_status?: ActiveStatus;
  email?: string | null;
  user_name?: string; // Usually synced with mobile_number automatically
  user_password?: string; // If they are resetting their password
}
