function doGet(e) {
  payload = JSON.stringify({ message: 'hello' })
  const output = ContentService.createTextOutput();
  output.setMimeType(ContentService.MimeType.JSON);
  output.setContent(payload);
  return output;
}