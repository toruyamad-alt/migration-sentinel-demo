# migration-sentinel-demo

Minimal demo repository for [`toruyamad-alt/migration-sentinel`](https://github.com/marketplace/actions/migration-sentinel).

This repo shows two common integration patterns:

- `db/migrate` for Rails-style SQL or Ruby migrations
- `prisma/migrations` for Prisma-managed schema changes

## GitHub Action example

```yaml
name: Migration checks

on:
  pull_request:

jobs:
  rails-migrations:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: toruyamad-alt/migration-sentinel@v0.1.1
        with:
          target: db/migrate
          output: github
          fail-on: high

  prisma-migrations:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: toruyamad-alt/migration-sentinel@v0.1.1
        with:
          target: prisma/migrations
          output: github
          fail-on: high
```

## Included examples

- [`db/migrate/202603190001_add_timezone.sql`](/Users/ty/Desktop/migration-sentinel-demo/db/migrate/202603190001_add_timezone.sql): safe backfill + `NOT NULL`
- [`db/migrate/202603190002_drop_legacy_status.sql`](/Users/ty/Desktop/migration-sentinel-demo/db/migrate/202603190002_drop_legacy_status.sql): intentionally risky `DROP COLUMN`
- [`prisma/migrations/202603190001_add_timezone/migration.sql`](/Users/ty/Desktop/migration-sentinel-demo/prisma/migrations/202603190001_add_timezone/migration.sql): Prisma migration example
