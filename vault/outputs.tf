
output "vault_example" {
  value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
} 

output "vault_example3" {
     value = nonsensitive(data.vault_generic_secret.vault_example3.data)
   }
   
