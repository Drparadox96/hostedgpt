if Setting.default_openrouter_key.present?
  Rails.logger.info("[HostedGPT] OpenRouter default key configured.")

  # Register OpenRouter as an available provider
  Llm::Clients.register(
    :openrouter,
    Llm::Clients::OpenAI.new(
      api_key: Setting.default_openrouter_key,
      base_url: "https://openrouter.ai/api/v1"
    )
  )
end
