-- Example baseline only; review against the actual CBS schema.
CREATE TABLE starter_migration_check (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
