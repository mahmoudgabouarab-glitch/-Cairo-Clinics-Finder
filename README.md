# 🏥 Cairo Clinics Finder

A Flutter app that helps users discover and book nearby clinics, view doctor profiles, manage favorites, and rate their experiences — all powered by Firebase and OpenStreetMap.

---

## ✨ Features

- **🗺️ Interactive Map** — Browse clinics on an OpenStreetMap-powered map with color-coded markers per specialty
- **🔍 Search & Filter** — Search clinics by name or filter by specialty category
- **📋 Clinic Details** — View doctor info, degree, working hours, booking type, ratings, and location
- **⭐ Ratings** — Rate clinics with a real-time rating system using Firestore transactions
- **❤️ Favorites** — Save and manage favorite clinics synced to your account
- **📅 Working Days** — Clinics display their available working days
- **🔐 Authentication** — Full auth flow: Sign In, Sign Up, Email Verification, Forgot Password
- **👤 Profile Management** — View and edit profile, change password, upload profile photo
- **🏥 Clinic Management** — Doctors can add and manage their own clinics
- **📍 Location-aware** — Uses device GPS to show nearby clinics
---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.x |
| State Management | BLoC / Cubit |
| Navigation | GoRouter |
| Dependency Injection | GetIt |
| Backend | Firebase (Auth + Firestore) |
| Image Upload | Cloudinary via Dio |
| Map | flutter_map (OpenStreetMap) |
| UI Scaling | flutter_screenutil |

---

## 📦 Key Dependencies

```yaml
flutter_bloc: ^9.1.1        # State management
go_router: ^17.2.0          # Navigation
get_it: ^9.2.1              # Dependency injection
dartz: ^0.10.1              # Functional programming (Either)
equatable: ^2.0.8           # Value equality
firebase_auth: 4.16.0       # Authentication
cloud_firestore: 4.15.4     # Database
flutter_map: ^8.2.2         # OpenStreetMap
geolocator: 10.1.0          # GPS location
dio: ^5.9.2                 # HTTP client / Cloudinary upload
image_picker: ^1.2.1        # Profile & clinic image selection
cached_network_image: ^3.4.1 # Image caching
flutter_rating_bar: ^4.0.1  # Rating UI
font_awesome_flutter: ^11.0.0 # Map marker icons
lottie: ^3.3.2              # Animations
```

---

## 🗂️ Project Structure

```
lib/
├── core/
│   ├── errors/          # Failure classes (AuthFirebaseFailure, FirestoreFailure)
│   ├── utils/           # Validators, spacing, CategoryHelper, LocationHelper
│   └── widgets/         # Shared widgets (CustomCard, CustomTextFormField, ...)
│
└── feature/
    ├── about/ 
    ├── auth/            
    ├── Favorite/            
    ├── Home/  
    ├── my_clinics/      
    ├── onbording/
    ├── profile/        
    └── splash/         
```

