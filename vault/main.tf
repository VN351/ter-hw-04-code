data "vault_generic_secret" "vault_example"{
 path = var.secret_path
}


resource "vault_generic_secret" "vault_example2" {
  path = var.secret_path1

  data_json = jsonencode(var.secret_data)
}

data "vault_generic_secret" "vault_example3"{
 path = var.secret_path1
}