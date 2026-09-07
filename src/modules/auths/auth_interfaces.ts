import { BloodGroup, Gender, Religion, UserPosition, UserRole } from "#db-client";

export interface IAuthLogin {
  user_name: string;
  user_password: string;
}

export interface IAuthRegistration{
  full_name:string;
  mobile_number: string;
  gender: Gender;
  blood_group?: BloodGroup;
  date_of_birth?: Date;
  height_in_cm?: number;
  weight_in_kg?: number;
  religion?: Religion;
  nationality?: string;
  birth_certificate_number?: string;
  nid_number?: string;
  email?: string;
  position?: UserPosition;
  role?: UserRole;
}

