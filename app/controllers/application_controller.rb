class ApplicationController < ActionController::API

      #get llave ECOBICI
    def ecobici_temporal_key
      @llave = Save.all.last
      if  @llave.nil? || @llave.access_token.nil?
        obtener_llave
      elsif  !llave_invalida
        obtener_llave
      end
      @llave = Save.all.last
    end

    #verificacion llave de ECOBICI
    def llave_invalida
      fecha_actual = Time.now.in_time_zone("America/Mexico_City")
      @llave.fecha.to_time+1.hours > fecha_actual 
    end

    #obtener llave de ECOBICI
    def obtener_llave
      url = "https://pubsbapi.smartbike.com/oauth/v2/token?client_id=#{ENV['pusher_client_id']}&client_secret=#{ENV['pusher_client_secret']}&grant_type=client_credentials"
     puts url
      response = response = HTTParty.get(url)
      json = JSON.parse(response.body)
      Save.delete_all
      Save.create(access_token: json['access_token'], fecha: Time.now.in_time_zone("America/Mexico_City"))
    end

end
