﻿namespace ModulesRegistry.Services.Implementations;

public sealed class ContentService
{
    public readonly string MarkdownPath = "content/markdown";
    private readonly IHttpClientFactory ClientFactory;
    public ContentService(IHttpClientFactory clientFactory, string? markdownPath = null)
    {
        ClientFactory = clientFactory;
        MarkdownPath = markdownPath ?? MarkdownPath;
    }
    public async Task<TextContent> GetTextContent(string content) =>
        await LanguageExtensions.CurrentCulture.GetMarkdownAsync(MarkdownPath, content).ConfigureAwait(false);

    public async Task<TextContent> GetTextContent(string content, string? language)
    {
        if (string.IsNullOrWhiteSpace(language))
            return await GetTextContent(content).ConfigureAwait(false);
        return await language.GetMarkdownAsync(MarkdownPath, content).ConfigureAwait(false); // To bypass unsupported Cultures in Azure.
    }

    public async Task<TextContent> GetRemoteTextContent(string href)
    {
        using var client = ClientFactory.CreateClient();
        string markdown = await client.GetStringAsync(href).ConfigureAwait(false) ?? string.Empty;
        return new TextContent(markdown, "MD", DateTimeOffset.Now);
    }

    public Task<DateTimeOffset> GetLastModifiedTimeOfTextContent(string content)
    {
        var directory = new DirectoryInfo(MarkdownPath);
        var files = directory.GetFiles($"{content}.*");
        if (files.Length == 0) return Task.FromResult(DateTimeOffset.MinValue);
        var lastModified = files.Max(f => f.LastWriteTimeUtc);
        return Task.FromResult(lastModified.ToDateTimeOffset());
    }
}
