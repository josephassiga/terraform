/*output "cognito_pool_name" {
   value="${aws_cognito_identity_pool.cognito_pool_user.id}"
}*/


output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}
