# Build the Go Binary
FROM golang:1.20 as build_sales-api
ENV CGO_ENABLED 0
ARG BUILD_REF

COPY . ./service
WORKDIR /service
RUN go build -ldflags "-X main.build=${BUILD_REF}"

FROM alpine:3.14
ARG BUILD_DATE
ARG BUILD_REF
COPY --from=build_sales-api /service /service/service
WORKDIR /service
CMD ["./service"]

LABEL org.opencaontainers.image.created="${BUILD_DATE}" \
       org.opencaontainers.image.title="sales-api" \
       org.opencaontainers.image.authors="Monkey" \
       org.opencaontainers.image.source="https://github.com/welschmoor/beservice" \
       org.opencaontainers.image.revision="${BUILD_REF}" \
       org.opencaontainers.image.vendor="Diggo"
