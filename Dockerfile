FROM quay.io/keycloak/keycloak:21.1.1 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true


# Configurar diretório para persistência do H2
RUN mkdir -p /opt/keycloak/data/h2

# Configuração para usar um volume montado no caminho /opt/keycloak/data/h2
VOLUME ["/opt/keycloak/data/h2"]

ENV KC_PROXY=edge
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8080
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=g7#Pq!xZ8T*B
ENV WEBSITES_ENABLE_APP_SERVICE_STORAGE=true


EXPOSE 8080

# Tornar o ponto de entrada flexível para que possamos especificar como rodar o Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start --optimized --hostname-strict false --http-enabled true --hostname-strict-https false"]
