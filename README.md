# Peentar ID

English documentation: See README.en.md

## Instalasi

Tambahkan ini ke `Gemfile`:

    gem 'peentar_id', '~> 1.0.1'

Kemudian jalankan `bundle`.

## Penggunaan

Anda bisa menggunakan Devise atau Omniauth vanilla. Setelah instalasi,
jangan lupa untuk menambahkan Redirect URI (Lihat bagian bawah).

### Devise

Gunakan ini di Devise:

    config.omniauth :peentar_id, Rails.application.secrets.peentar_id_client, Rails.application.secrets.peentar_id_secret

### Omniauth

Gunakan ini di Omniauth:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :peentar_id,
        Rails.application.secrets.peentar_id_client,
        Rails.application.secrets.peentar_id_secret
    end

## Menentukan Redirect URI

Anda perlu memasukkan redirect URI secara manual untuk alasan keamanan.
Di masing-masing `development.rb`, `test.rb` dan `production.rb`, tambahkan
redirect URI Anda. Misalnya:

    # development.rb
    PeentarID.redirect_uri = 'http://localhost:3000'

    # test.rb
    PeentarID.redirect_uri = 'http://localhost:3000'

    # production.rb
    PeentarID.redirect_uri = 'https://smartstock.peentar.id/callbackoauth2'

Jangan lupa juga untuk menambahkan perintah di atas ke lingkungan
yang lain jika Anda memiliki lingkungan selain tiga di atas (misalnya `staging.rb`)
