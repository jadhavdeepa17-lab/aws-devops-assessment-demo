resource "aws_cognito_user_pool" "user_pool" {
  name = "devops-assessment-user-pool"

  password_policy {
    minimum_length = 8
    require_numbers = true
    require_symbols = true
    require_uppercase = true
    require_lowercase = true
  }

  auto_verified_attributes = ["email"]
}

resource "aws_cognito_user_pool_client" "app_client" {
  name         = "devops-assessment-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id

  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
}