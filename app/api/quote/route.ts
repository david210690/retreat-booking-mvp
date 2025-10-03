// POST /api/quote  -> returns a fake signed URL for a generated PDF (placeholder)
export async function POST(req: Request) {
  const input = await req.json().catch(() => ({}))
  const fakeUrl = `https://example.com/retreat-quote-${crypto.randomUUID()}.pdf`
  return new Response(JSON.stringify({ ok: true, pdf_url: fakeUrl, input }), {
    headers: { 'content-type': 'application/json' },
    status: 200
  })
}
