# Claude Code Memory - Simple Command Dispatcher Demo App

## Project Overview
Rails 8 API application demonstrating the `simple_command_dispatcher` gem for implementing dynamic versioned API endpoints. Created to showcase the gem's capability for handling multiple API versions with a single controller.

## Architecture Decisions
- **Command Pattern**: Business logic in versioned command objects under `app/api/v1/` and `app/api/v2/`
- **Dynamic Versioning**: Single MechsController routes to different command versions based on request path
- **JWT Authentication**: Stateless authentication using JWT tokens
- **Clean API Design**: RESTful endpoints with JSON responses

## Key Implementation Details

### Dynamic Command Routing
The core innovation - one controller handles all API versions:
```ruby
# MechsController handles both /api/v1/mechs/search and /api/v2/mechs/search
# SimpleCommandDispatcher uses request.path to find the right command
result = SimpleCommandDispatcher.call(
  command: request.path,
  command_namespace: nil,
  request_params: params
)
```

### Commands Structure
```
app/api/
├── v1/mechs/search.rb    # Simple mech_name search only
└── v2/mechs/search.rb    # Advanced search with OR logic (mech_name, variant, tonnage, cost, introduction_year)
```

### Authentication System
- **JWT-based**: Stateless token authentication
- **UsersController**: User signup, profile management
- **SessionsController**: Login/logout operations
- **ApplicationController**: JWT decode/encode methods

### Database Models
- **User**: username, email, first_name, last_name, password_digest, role (enum: user/admin)
- **Mech**: Comprehensive BattleTech mech attributes (mech_name, variant, tonnage, etc.)

### Scopes and Search Logic
Mech model has scopes that handle nil values:
```ruby
scope :by_mech_name, ->(name) { name.present? ? where("mech_name ILIKE ?", "%#{name}%") : none }
# ... other scopes
```

V2 command uses OR logic: `Mech.by_mech_name(params[:mech_name]).or(Mech.by_variant(params[:variant]))...`

## Technology Stack
- Rails 8.0 API mode
- PostgreSQL database
- JWT for authentication
- BCrypt for password hashing
- RSpec + FactoryBot for testing
- simple_command_dispatcher gem (local path dependency)

## Development Commands
```bash
# Setup
bundle install
rails db:create db:migrate db:seed

# Run server
rails server

# Run tests  
bundle exec rspec
```

## API Endpoints

### Authentication
- `POST /signup` - Create user account
- `POST /login` - Login and get JWT token
- `DELETE /logout` - Logout (client-side token removal)
- `GET /profile` - Get current user profile

### Mech Search (Authenticated)
- `GET /` - List all mechs
- `GET /api/v1/mechs/search?mech_name=Atlas` - V1 search (mech_name only)
- `GET /api/v2/mechs/search?mech_name=Atlas&tonnage=100` - V2 search (multiple params with OR)

## Testing Setup
- FactoryBot with legendary BattleTech mechs (Atlas, Awesome, Marauder, Mad Cat, etc.)
- Auth helpers for JWT token generation in specs
- Request specs for both API versions

## Configuration
- `config/initializers/simple_command_dispatcher.rb` - Autoloading from `app/api/`
- Commands namespace: request path maps to command class
- JWT secret from Rails credentials

## Seed Data
- Users: juser (user role), jadmin (admin role)
- Mechs: Comprehensive BattleTech mech database

## Parent Gem Context
This demo was created to showcase `simple_command_dispatcher` v4.0.0 capabilities:
- Dynamic command routing based on request path
- Multiple API versions with single controller
- Clean separation of concerns
- Backwards compatibility and versioning

## Current State
- ✅ Full authentication system with JWT
- ✅ Dynamic versioned API endpoints  
- ✅ Comprehensive test suite
- ✅ BattleTech mech data model
- ✅ Factory setup with legendary mechs
- 🚧 Database schema needs migration run (password_digest column added)

## Next Steps
1. Run migrations to add password_digest column
2. Seed database with test data
3. Run test suite to verify all functionality
4. Add more API versions (v3) to demonstrate scalability