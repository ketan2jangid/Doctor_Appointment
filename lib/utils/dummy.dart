const packagesAvailable = ["Messaging", "Voice Call", "Video Call", "In Person"];

const duration = ["30 min", "60 min"];

const doctors = {
  "doctor_name": "Dr. John Doe",
  "image": "https://hireforekam.s3.ap-south-1.amazonaws.com/doctors/1-Doctor.png",
  "speciality": "Cardiologist",
  "location": "123 Health St, MedCity",
  "patients_served": 1200,
  "years_of_experience": 15,
  "rating": 4.7,
  "number_of_reviews": 350,
  "availability": {
    "2023-09-18": [
      "9:00 AM - 10:00 AM",
      "11:00 AM - 12:00 PM"
    ],
    "2023-09-19": [],
    "2023-09-20": [
      "10:00 AM - 11:00 AM"
    ],
    "2023-09-21": [
      "1:00 PM - 2:00 PM",
      "4:00 PM - 5:00 PM"
    ]
  }
};

const appointments = [
  {
    "booking_id": "A123",
    "doctor_name": "Dr. John Doe",
    "location": "123 Health St, MedCity",
    "appointment_date": "2023-09-18",
    "appointment_time": "09:00 AM - 09:30 AM"
  },
  {
    "booking_id": "A124",
    "doctor_name": "Dr. Jane Smith",
    "location": "456 Wellness Ave, MedCity",
    "appointment_date": "2023-09-20",
    "appointment_time": "03:00 PM - 04:00 PM"
  }
];

const confirmationData = {
  "doctor_name": "Dr. John Doe",
  "appointment_date": "2023-09-18",
  "appointment_time": "09:00 AM - 09:30 AM",
  "location": "123 Health St, MedCity",
  "appointment_package": "Video Call"
};