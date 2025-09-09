# Puma configuration for Render Standard instance

# Use up to 5 threads (low memory but allows some concurrency)
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Workers: use 2 to leverage multiple cores
# (each worker forks the app into its own process)
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Worker timeout (120s = safe for GPT API calls, but not infinite)
worker_timeout 120

# Bind to Render's required host/port
port ENV.fetch("PORT") { 10000 }
bind "tcp://0.0.0.0:#{ENV.fetch("PORT") { 10000 }}"

# Allow restart via bin/rails restart
plugin :tmp_restart

# PID file (optional)
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Only run SolidQueue if explicitly enabled
if ENV.fetch("RUN_SOLID_QUEUE_IN_PUMA") { false }
  plugin :solid_queue
end
