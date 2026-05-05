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
flutter_bloc: ^9.1.1           # State management
go_router: ^17.2.0             # Navigation
get_it: ^9.2.1                 # Dependency injection
dartz: ^0.10.1                 # Functional programming (Either)
equatable: ^2.0.8              # Value equality
firebase_auth: 6.4.0           # Authentication
cloud_firestore: 6.3.0         # Database
flutter_map: ^8.2.2            # OpenStreetMap
geolocator: 14.0.2             # GPS location
dio: ^5.9.2                    # HTTP client / Cloudinary upload
image_picker: ^1.2.1           # Profile & clinic image selection
cached_network_image: ^3.4.1   # Image caching
flutter_rating_bar: ^4.0.1     # Rating UI
font_awesome_flutter: ^11.0.0  # Map marker icons
lottie: ^3.3.2                 # Animations
```

---

## 🗂️ Project Structure

```
lib/
├── core/
│   ├── errors/ 
│   ├── utils/  
│   └── widgets/
│
└── feature/
    ├── about/ 
    ├── auth/            
    ├── Favorite/            
    ├── Home/  
    ├── my_clinics/      
    ├── onboarding/
    ├── profile/        
    └── splash/         
```
## 📸 Screenshots

### 🔐 Auth Screens

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/f9872e76-31bd-41e0-89b1-3b86d7930780" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/35d9bd69-b86f-4220-b304-7832f8796194" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/01d49794-9c12-448b-b6e6-0bcf4d8f55ad" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/eb5e503f-70ff-4ca3-a1b8-cd66837289b8" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/f9e9fdbf-8c20-463b-b1a5-a9dfd7e8fe1a" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/10454b38-f0a3-4e90-9002-c3bd327a34ab" width="200"/></td>
  </tr>
</table>

---

### 🏠 Home Screens

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/4a03efde-1c16-4f39-87d6-b961343c3d07" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/1ede7cc2-3617-492e-9b21-3dff59d47ed1" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/642f1a79-07b7-4b7f-90cd-7de4b06d6f2c" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/58a6102b-d109-43a0-8965-9482c72070fe" width="200"/></td>
  </tr>
</table>

---

### 👤 Profile Screens

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/92edc96b-86d9-4a35-921b-5ceed1e99c78" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/6b8e8ae9-cd7d-4132-a5d8-5fca0e0561a8" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/1eb52f3f-b2d9-407b-b77f-f1a88a9a77f7" width="200"/></td>
    <td></td>
  </tr>
</table>

---

### 🏥 My Clinic Screens

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/10cb2a20-cadf-49d8-9ccf-3c7f4c3d3b66" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/bc2edaff-0659-42da-b87f-0e0317000b35" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/464bd98d-4e36-410e-8caa-11ac50efb970" width="200"/></td>
    <td></td>
  </tr>
</table>

---

### 📋 Details Screen

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/a50497e5-c743-4390-bb4c-21e3e0576970" width="200"/></td>
    <td></td>
  </tr>
</table>

---

### ❤️ Favorites Screen

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/85d059d4-5252-4533-961f-4a3407bf50ba" width="200"/></td>
    <td></td>
  </tr>
</table>

---

### ℹ️ About Screen

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/08c3226d-12cd-47d3-80ed-ce39af66a25e" width="200"/></td>
    <td></td>
  </tr>
</table>

---


<img width="1290" height="2796" alt="Image" src="https://github.com/user-attachments/assets/08c3226d-12cd-47d3-80ed-ce39af66a25e" />