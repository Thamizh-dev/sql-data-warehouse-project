# Data Warehouse Project – End-to-End Implementation

Introduction
This project is a full end-to-end implementation of a Data Warehouse, inspired by the work of Baraa Khatib Salkini. It follows a structured approach using Medallion Architecture (Bronze, Silver, Gold) to efficiently store, process, and analyze data.

The goal of this project is to demonstrate real-world data engineering workflows, including:
✔️ Data Ingestion from multiple sources
✔️ ETL Pipelines for transforming and cleaning data
✔️ Star Schema Modeling for optimized reporting
✔️ BI & Analytics to enable insights for business users

This repository contains SQL scripts, ETL pipelines, and data models to help anyone replicate and learn from the project step by step.

# 📖 Tools & Technologies Used 🛠️

The following tools were used to build and manage the Data Warehouse:
SQL Server Express – Lightweight database server for storing and querying data.
SQL Server Management Studio (SSMS) – GUI tool for managing and interacting with SQL databases.
Git & GitHub – Version control system to track project changes and collaborate.
Draw.io – Used to design data architecture diagrams, data flow models, and schema diagrams.
Notion – Used for project management, organizing tasks, and maintaining documentation.

# Methodology
This project is divided into seven key phases, each with specific tasks and deliverables:

1️⃣ Requirements Analysis 📋
Identify and document data sources (CSV, databases, APIs).
Define the scope and objectives of the Data Warehouse.
Deliverables: Documented requirements, data source details.

2️⃣ Data Architecture Design 🎨
Implement Medallion Architecture (Bronze, Silver, Gold).
Design data flow diagrams using Draw.io.
Deliverables: Data architecture document, data flow diagrams.

3️⃣ Project Initialization 🛠️
Create project tasks and timelines in Notion.
Set up GitHub repository, database schemas, and SQL Server.
Deliverables: Git structure, database & schema setup.

4️⃣ Bronze Layer 🥉 (Raw Data Storage)
Extract data from source systems (CSV, APIs, Databases).
Load raw data into the Bronze Layer.
Deliverables: Stored raw data, validation of completeness.

5️⃣ Silver Layer 🥈 (Cleansed & Processed Data)
Transform, clean, and standardize the data.
Validate and integrate data for consistency.
Deliverables: Cleaned data stored in the Silver Layer.

6️⃣ Gold Layer 🥇 (Business-Ready Data)
Implement Star Schema modeling (fact & dimension tables).
Create aggregated tables for reporting.
Deliverables: Business-ready data, Star Schema model.

7️⃣ Data Consumption 📈 (BI & Analytics)
Create views and flat tables for reporting & dashboards.
Optimize queries for business intelligence and machine learning.
Deliverables: Data ready for SQL queries, BI reports, and analytics.



