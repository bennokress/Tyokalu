# Working with APIs

The **Get Contents of URL** action turns Shortcuts into a powerful API client. You can fetch data, send information, and integrate with web services.

## The Basics

At its simplest, pass a URL to the action and it returns the content. For basic GET requests, that's all you need.

Tap **Show More** to reveal advanced options for more complex requests.

## HTTP Methods

| Method | Purpose |
|--------|---------|
| GET | Retrieve data |
| POST | Create new data |
| PUT | Replace existing data |
| PATCH | Modify existing data |
| DELETE | Remove data |

## Adding Headers

Many APIs require headers for authentication or to specify content types. Under the advanced options, add headers as key-value pairs:

- **Authorization** - Often `Bearer {your-api-key}` for authenticated APIs
- **Content-Type** - Usually `application/json` for JSON APIs

## Sending Data (Request Body)

When using POST, PUT, or PATCH, you can include a request body:

- **JSON** - For structured data (most common for modern APIs)
- **Form** - For form-encoded data or multipart uploads
- **File** - For sending files directly

The built-in JSON editor works for simple objects. For complex payloads (like arrays at the top level), create the JSON in a **Dictionary** action and pass it as a File input instead.

## Handling JSON Responses

Most APIs return JSON. To work with the response:

1. The output from **Get Contents of URL** is already parsed if it's valid JSON
2. Use **Get Dictionary Value** to extract specific keys
3. For nested data, chain multiple **Get Dictionary Value** actions or use dot notation in the key path

## Common Gotcha: Base64 Line Wrapping

If you're sending Base64-encoded data in your request and it's failing, check the encoding settings. The default wraps lines at 76 characters - set it to "None" for unmodified output.

---

[← Previous: Base64 Encoding](Base64%20Encoding.md) | [Back to Overview](README.md) | [Next: Advanced Menus →](Advanced%20Menus.md)
