# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  config.secret_key = 'e51236015b05f7b035a1feaa2fd52178e957705840e01af20ad2542b695cc1aa40004a9692bc54537c69e764224039a575d0b2ab975e37196dce7bc0bc4aeb63'
end