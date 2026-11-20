# TX LA FIRME API (base inicial)

Backend Node.js/Express + PostgreSQL para la app de pasajeros.

## Render
- Runtime: Node
- Build Command: `npm install`
- Start Command: `npm start`
- Root Directory: `backend` (si esta carpeta se sube dentro del repositorio)
- Variables: `DATABASE_URL` (PostgreSQL), `JWT_SECRET` (secreto aleatorio largo), opcional `CORS_ORIGIN`.

Ejecutar `schema.sql` una vez en la base PostgreSQL antes de usar la API.

## Endpoints
- `GET /api/v1/health`
- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `GET /api/v1/me`
- `GET /api/v1/routes`
- `GET /api/v1/trips`
- `GET /api/v1/trips/:id`
- `POST /api/v1/bookings` (requiere token)
- `GET /api/v1/bookings/mine` (requiere token)
- `POST /api/v1/admin/routes`, `/api/v1/admin/fares`, `/api/v1/admin/trips` (requieren usuario con rol admin)

## Importante
Esta es una base inicial, no un sistema listo para producción. Antes de operar con clientes reales hay que completar la creación segura del primer administrador, gestión de conductores, pagos y comprobantes, validación de reservas/cancelaciones, auditoría, privacidad y pruebas. No uses datos reales ni cobres dinero hasta completar esas partes.
