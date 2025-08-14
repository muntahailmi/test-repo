retryable_errors = [
  ".*HTTP response was nil; connection may have been reset.*",
  ".*performing CreateOrUpdate.*",
  ".*connection reset by peer.*",
  ".*transport connection broken.*"
]
 
retry_max_attempts = 10
retry_sleep_interval_sec = 30
 
terraform { 
  # Add retry configuration
  extra_arguments "retry_args" {
    commands  = [
      "apply",
      "plan",
      "destroy"
    ]
    arguments = []
  }
}
remote_state {
  backend = "gcs"
  config = {
    bucket = getenv("REMOTESTATE_BUCKET")
    prefix = getenv("REMOTESTATE_PREFIX","terraform.state")
    project = getenv("REMOTESTATE_PROJECT")
    location = getenv("REMOTESTATE_LOCATION")
  }
}
