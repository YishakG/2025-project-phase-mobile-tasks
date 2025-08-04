# Project Documentation: Architecture and Data Overview

## Project Architecture

This project follows the **Clean Architecture** principles to promote a scalable, maintainable, and testable codebase. The project structure separates concerns into distinct layers, each with a clear responsibility:

### Folder Structure

- **lib/core**  
  Contains shared components, utilities, and core logic such as error handling, constants, and reusable helpers that are used across multiple features.

- **lib/features**  
  Contains feature-specific modules. Each feature is self-contained and includes its own domain, data, and presentation layers.

- **lib/features/product**  
  This module is dedicated to the Ecommerce feature focusing on product-related functionality. It encapsulates everything related to product entities, models, repositories, and UI.

- **test/**  
  Contains unit tests and widget tests to verify the correctness of the application logic and UI components.

## Data Flow

The data flow in this project aligns with Clean Architecture's separation of concerns:

1. **Presentation Layer**  
   User interactions and UI rendering happen here. Presentation components interact with the domain layer through use cases.

2. **Domain Layer**  
   This is the core business logic layer containing entities, repositories (abstract interfaces), and use cases. It is independent of any external dependencies or frameworks.

3. **Data Layer**  
   The data layer implements the repository interfaces from the domain layer. It handles data retrieval, including API calls, local database access, or cache.  
   Models in this layer (such as `ProductModel`) mirror the entities and provide JSON serialization/deserialization logic (`fromJson`, `toJson`) for smooth communication with external data sources.

## Features/Product Module Overview

- **Entities** (`lib/features/product/domain/entities/`)  
  Define immutable data structures representing the product in the domain layer, free of external dependencies.

- **Models** (`lib/features/product/data/models/`)  
  Implementations of the entities with additional functionality such as JSON serialization and deserialization.  
  Example: `ProductModel` extends `ProductEntity` and includes `fromJson` and `toJson` methods to handle JSON data.

- **Repositories** (`lib/features/product/domain/repositories/`)  
  Define abstract interfaces for data access.

- **Data Sources** (`lib/features/product/data/datasources/`)  
  Responsible for fetching data from remote APIs or local storage.

- **Use Cases** (`lib/features/product/domain/usecases/`)  
  Encapsulate single business operations like fetching product lists.

- **Presentation** (`lib/features/product/presentation/`)  
  UI screens, widgets, and state management logic.

## Testing

- Unit tests validate the correctness of models, use cases, and repositories.
- Widget tests ensure UI components behave as expected.
- Tests cover serialization/deserialization logic to ensure data integrity when interacting with APIs.

## Error Handling

The `core` layer provides a consistent error handling mechanism with custom exception classes and failure objects to manage expected and unexpected errors gracefully across layers.

## Summary

This modular and layered architecture provides:

- Clear separation of concerns
- High testability and maintainability
- Easy extensibility to add new features or replace implementations without affecting other parts of the app