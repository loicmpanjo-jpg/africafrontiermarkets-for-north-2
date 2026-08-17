# AFM broker backend integration

This branch preserves the repository’s existing archive and frontend content and adds a reviewable copy of the AFM FastAPI backend under `backend/`. The Dockerfile now builds only from that copied backend and starts `api_gateway.main:app` on Northflank’s `$PORT` (default `8000`).

The broker routes include the real instrument endpoint, explicit user-to-Alpaca account linking, and bearer-protected portfolio balance/positions. No credentials are stored in Git. Configure the database, Redis, auth, and Alpaca variables in Northflank’s secret manager after the PR is reviewed; do not commit them here.

Validation targets before deployment are `/`, `/health`, `/ready`, `/api/v1/broker/instruments`, and the protected `/api/v1/portfolio` flow.
