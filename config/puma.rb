# Puma configuration optimized for low-memory Render free instance

# Reduce threads to save memory
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 1 }  # 1 thread is enough
threads threads_count, threads_count

# No workers to avoid forking memory-heavy processes
workers 0

# Worker timeout for development
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Port
port ENV.fetch("PORT", 3000)

# Allow restart via bin/rails restart
plugin :tmp_restart

# PID file (optional)
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Only run SolidQueue if explicitly enabled
if ENV.fetch("RUN_SOLID_QUEUE_IN_PUMA") { false }
  plugin :solid_queue
end
