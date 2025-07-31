# smatbus
Create a new Laravel project called "SmartBus" using Blade templates.

The project is a transportation platform similar to GoBus or Uber Bus.

### Roles:
- **Administrator**
- **Bus Owner**
- **Driver**
- **Passenger**

### Functions for each role:

#### 1. Admin Panel:
- A complete dashboard with analytics and reports
- Manage all users: bus owners, drivers, and passengers
- View, edit, or delete all buses, trips, routes, and schedules
- Access financial reports, trip statistics, and user behavior
- Manage system settings
- Manage all balances and accounts of drivers and owners
- The administration takes 5% of the total for each trip, and this percentage may vary from one owner to another
- It also takes a fixed amount for registering or changing their buses

#### 2. Bus Owner Panel: Each owner can set a seat price for each bus, depending on the type of bus and the services it offers
- A dashboard to manage their buses and trips (each trip has a standard seat price on the website, and the owner may set a different price, and the price of the taxi may increase if The owner sets different fares for stations as the distance increases, their routes, and schedules.
- Create/edit/delete buses (board number, number of seats, etc.)
- Assign bus drivers
- View and manage passengers for each trip
- View upcoming and past trips
- Access their earnings and reports

#### 3. Driver Dashboard:
- View a list of custom trips
- View trip details: route, passenger list, time
- Confirm passenger boarding and disembarkation
- Mark trip as started, in progress, or completed
- View navigation or route map

#### 4. Passenger Portal:
- Register/Log In
- Browse available trips (departure "possibly current location", destination, date, time)
- View trip and bus details
- Select and reserve a specific seat (view seat map 15)
- Pay for the trip (integrate demo or real payment)
- View trip history and e-tickets

### Design/UI:
- Uses Laravel Blade with a modern UI (Bootstrap 5)
- Elegant, responsive design Mobile Compatible
- Dynamic UI for passenger seat selection
- Role-based routing and UI
- Multilingual support (Arabic and English)

### Architecture:
- Use Laravel policies for authorization
- Create stubs and factories for test data
- Follow MVC architecture with a repository/service pattern if necessary

### Database (Suggested Tables):
- Users (with role column)
- Buses
- Trips
- Routes
- Seats
- Reservations
- Passengers
- Driver Trip (Hub)
- Payments

### Additional Features:
- Notifications (for trip reminders or changes)
- Auto-delete important data
- Logs for administrative actions
- Settings panel for managing trip parameters

Enable notifications for all roles

This was created as a Laravel 11+ project using best practices.
Use light purple and make it scalable