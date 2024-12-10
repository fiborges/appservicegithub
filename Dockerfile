FROM quay.io/keycloak/keycloak:12.0.1

# Copia temas personalizados, se necessário
COPY themes /opt/jboss/keycloak/themes

# Copia o certificado para dentro do container
COPY DigiCertGlobalRootG2.crt.pem /usr/local/share/ca-certificates/

# Configura variáveis de ambiente para o PostgreSQL
ENV PROXY_ADDRESS_FORWARDING=true \
    KC_PROXY=passthrough \
    JAVA_OPTS="-Xms512m -Xmx1024m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=512m"

# Exponha a porta padrão do Keycloak
EXPOSE 8080

# Define o ponto de entrada padrão
ENTRYPOINT ["/opt/jboss/tools/docker-entrypoint.sh"]

CMD ["-b", "0.0.0.0"]
