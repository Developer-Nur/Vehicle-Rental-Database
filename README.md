# Vehicle Rental Database System

A robust PostgreSQL database design and implementation for managing vehicle rentals. This project focuses on relational data modeling, entity relationships, and complex SQL querying to handle real-world rental scenarios involving users, vehicles, and bookings.

---

## Project Overview

The objective of this project is to build a structured database system for a **Vehicle Rental Service**. It efficiently tracks different user roles (Admin/Customer), manages diverse vehicle fleets (Cars, Bikes, Trucks), and handles the end-to-end booking process, including cost calculation and availability tracking.

## Database Architecture

The system is built on three core entities with relational integrity:

- **Users Table**: Stores user profiles with unique email constraints and role-based access (Admin/Customer).
- **Vehicles Table**: Manages vehicle inventory, including types, registration details, and real-time status (Available, Rented, Maintenance).
- **Bookings Table**: The central hub connecting users and vehicles, tracking dates, statuses (Pending to Completed), and financial totals.

### Entity Relationships

- **User → Bookings**: One-to-Many (One user can have multiple history/active bookings).
- **Vehicle → Bookings**: One-to-Many (One vehicle can be booked multiple times over its lifecycle).
- **Primary/Foreign Keys**: Strict enforcement of data integrity through PK/FK constraints.

---

## SQL Implementation & Queries

The project includes a series of SQL queries designed to solve specific business problems. Key concepts used include:

### 1. Booking History (JOIN)

Retrieve detailed booking logs including the customer's name and the specific vehicle model.

- **Concept**: `INNER JOIN`

### 2. Inventory Analysis (EXISTS)

Identify vehicles that have remained unbooked to optimize fleet utilization.

- **Concept**: `NOT EXISTS`

### 3. Filtered Search (WHERE)

Filter vehicles based on specific categories (e.g., Cars) and their current availability.

- **Concept**: `SELECT` & `WHERE` clauses.

### 4. Utilization Reports (GROUP BY & HAVING)

Identify high-demand vehicles that have been booked more than twice to analyze popular inventory.

- **Concept**: `GROUP BY`, `HAVING`, and `COUNT`.

---

## Project Structure

The repository is organized as follows:

- **[queries.sql](./queries.sql)**: Contains the full SQL scripts for table creation and query solutions.
- **[README.md](./README.md)**: Project documentation and overview.
