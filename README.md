# 🦸 Marvel Cinematic Universe Intelligence Dashboard & Success Prediction System

## 🔴 Live Dashboard
👉 [Open JARVIS Dashboard](https://github.com/HariPrasad017/MCU-Intelligence-Dashboard/blob/main/dashboard/MCU_Intelligence_Dashboard.html)

## 📌 Project Overview

The Marvel Cinematic Universe (MCU) is one of the most successful entertainment franchises in history, generating billions of dollars in worldwide box-office revenue across movies and streaming series.

This project presents a complete end-to-end Data Analytics, Business Intelligence, and Machine Learning solution designed to analyze MCU performance, identify success factors, predict future movie outcomes, and provide actionable business insights through interactive dashboards and predictive models.

The system integrates Python Analytics, SQL, Machine Learning, Clustering, Recommendation Systems, and Power BI to create a comprehensive Marvel Intelligence Platform.

---

## 🎯 Problem Statement

Entertainment companies invest hundreds of millions of dollars into film production and marketing. Understanding the factors that drive commercial success is critical for strategic decision-making.

This project aims to answer key business questions such as:

* Which MCU movies generated the highest revenue?
* Which directors delivered the highest return on investment (ROI)?
* What factors influence box-office success?
* Can we predict future revenue using machine learning?
* Can movies be segmented into meaningful performance groups?
* Can similar MCU movies be recommended based on content characteristics?

---

## 📊 Dataset Information

The dataset contains detailed information about MCU movies and Disney+ series including:

### Movie Attributes

* Title
* Release Year
* MCU Phase
* Runtime
* Genre
* Director

### Ratings & Reviews

* IMDb Rating
* Rotten Tomatoes Critic Score
* Rotten Tomatoes Audience Score
* Number of Votes

### Financial Metrics

* Production Budget
* Domestic Revenue
* International Revenue
* Worldwide Revenue
* Opening Weekend Revenue
* Profit
* Return on Investment (ROI)

### Streaming Metrics

* Trailer Views
* Trailer Likes
* Trailer Count

### Success Metrics

* Success Category

  * Blockbuster
  * Hit
  * Average
  * Flop

Total Records: 49 MCU Movies & Series

---

## 🛠 Technology Stack

### Programming & Analytics

* Python
* Pandas
* NumPy

### Data Visualization

* Matplotlib
* Seaborn

### Database

* MySQL
* SQL Workbench

### Machine Learning

* Scikit-Learn
* Random Forest
* Linear Regression
* K-Means Clustering

### Business Intelligence

* Power BI
* DAX Measures

### Web Development

* HTML
* CSS
* JavaScript

---

## 🧹 Data Cleaning & Feature Engineering

The dataset was cleaned and transformed using Python.

Key preprocessing tasks:

* Missing value handling
* Data type correction
* Revenue calculations
* Profit calculation
* ROI calculation
* Success category generation
* Success score creation
* Feature scaling
* Encoding categorical variables

---

## 📈 Exploratory Data Analysis (EDA)

Comprehensive exploratory analysis was performed to uncover patterns and trends.

### Visualizations Created

* IMDb Rating Distribution
* Budget vs Revenue Analysis
* Top Grossing MCU Movies
* Revenue by MCU Phase
* Critics vs Audience Score Comparison
* Correlation Heatmap
* Revenue Distribution Analysis

Key insights were extracted to support business intelligence reporting.

---

## 🗄 SQL Integration

A relational database was designed and implemented using MySQL.

### Database Tables

* movies
* ratings
* box_office
* streaming_stats
* movie_success_metrics

### SQL Concepts Applied

* JOIN Operations
* Aggregate Functions
* GROUP BY
* Window Functions
* Ranking Queries
* Subqueries
* Views

### Custom Views

#### Marvel Executive Dashboard

Provides consolidated business metrics.

#### Marvel Success Score

Custom intelligence metric combining:

* IMDb Rating
* Audience Score
* ROI

---

## 🤖 Machine Learning Models

### 1. Revenue Prediction Model

Objective:

Predict worldwide box-office revenue.

#### Input Features

* Production Budget
* IMDb Rating
* Audience Score
* Critic Score
* Runtime
* MCU Phase
* Number of Votes

#### Algorithms

* Linear Regression
* Random Forest Regressor

#### Evaluation Metrics

* R² Score
* Mean Absolute Error (MAE)

---

### 2. Success Classification Model

Objective:

Predict movie success category.

#### Categories

* Blockbuster
* Hit
* Average
* Flop

#### Algorithm

* Random Forest Classifier

#### Evaluation Metrics

* Accuracy
* Precision
* Recall
* F1 Score
* Confusion Matrix

---

## 🎯 MCU Movie Segmentation

K-Means Clustering was used to segment MCU content based on:

* Success Score
* IMDb Rating
* Worldwide Revenue

### Cluster Categories

#### MCU Legends

High revenue and exceptional audience reception.

#### Successful Heroes

Commercially successful and positively rated content.

#### Struggling Titles

Lower-performing movies and series.

This analysis provides franchise-level strategic insights.

---

## 🎬 Marvel Recommendation Engine

A content-based recommendation system was developed using:

* TF-IDF Vectorization
* Cosine Similarity

The engine recommends similar MCU movies and series based on:

* Genre
* Director
* Success Category

Example:

Input:
Iron Man

Recommendations:

* Iron Man 2
* Captain America: Civil War
* Spider-Man Homecoming
* Avengers: Endgame

---

## 📊 Power BI Dashboard

An interactive executive dashboard was developed in Power BI.

### Dashboard Pages

#### Executive Overview

* Total Revenue
* Total Profit
* Average IMDb Rating
* Average ROI

#### MCU Success Intelligence

* Success Score Analysis
* Revenue Performance
* ROI Comparison

#### Movie Segmentation Analysis

* Cluster Distribution
* Revenue vs Ratings
* Performance Groups

#### Director Intelligence

* Highest Revenue Director
* Highest ROI Director
* Highest Rated Director
* Director Performance Comparison

Custom DAX measures were created to support executive-level reporting.

---

## 📈 Key Business Insights

* Phase 3 generated the highest overall franchise revenue.
* Avengers: Endgame remains the highest-grossing MCU title.
* Director performance significantly influences commercial success.
* Audience scores show strong correlation with revenue performance.
* MCU content can be segmented into distinct performance groups.

---

## 🚀 Future Scope

Future enhancements include:

* SHIELD AI Assistant
* Real-time Marvel Analytics
* Sentiment Analysis using Social Media Reviews
* Deep Learning Revenue Prediction Models
* Interactive AI Chatbot
* Cloud Deployment
* Real-time Dashboard Integration

---

## 🏆 Project Outcomes

This project demonstrates practical expertise in:

* Data Analytics
* Business Intelligence
* SQL Development
* Machine Learning
* Recommendation Systems
* Data Visualization
* Dashboard Development
* End-to-End Project Design

The final solution combines analytics, machine learning, and business intelligence into a unified Marvel Intelligence Platform capable of delivering actionable insights and predictive capabilities.

