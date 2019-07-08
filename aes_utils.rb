# frozen_string_literal: true

require 'openssl'
require 'base64'

# AES test
class AES
  def encrypt(key, encrypted_string)
    aes = OpenSSL::Cipher::Cipher.new('AES-256-ECB')
    aes.encrypt
    aes.key = key
    txt = aes.update(encrypted_string) << aes.final

    # 16 hex string
    # txt.unpack('H*')[0].upcase

    # base64 encode
    Base64.encode64(txt)
  end

  def decrypt(key, decrypted_string)
    aes = OpenSSL::Cipher::Cipher.new('AES-256-ECB')
    aes.decrypt
    aes.key = key

    # convert 16 hex string
    # aes.update([decrypted_string].pack('H*')) << aes.final

    # convert base64 decode
    aes.update(Base64.decode64(decrypted_string)) << aes.final
  end
end

key = '97128424897797a166913557a6f4cc8e'
string = '{"str":"abc.test.com","code":123456}'

aes = AES.new

aes_encrypt = aes.encrypt(key, string)

puts "密文: #{aes_encrypt}"

aes_decrypt = aes.decrypt(key, aes_encrypt)

puts "解密: #{aes_decrypt}"

# test_encrypt_string_hex = "79DFEA46A2C6C6C46EEB29CBF137E3046D00C598046025C7319
# FEBE621A52F75AF6B948B7D890FBA6B154729ABDB21BF"
test_encrypt_string_base64 = 'ed/qRqLGxsRu6ynL8TfjBG0AxZgEYCXHMZ/r5iGlL3Wva5SLfY
kPumsVRymr2yG/'

aes_decrypt = aes.decrypt(key, test_encrypt_string_base64)

puts "解密: #{aes_decrypt}"
