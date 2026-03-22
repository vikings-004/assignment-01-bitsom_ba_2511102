## Vector DB Use Case

A traditional keyword-based search would fall short for this use case. It works by matching exact words, which is a problem in legal documents where the same idea can be written in many different ways. In a long contract, something like a termination clause might be described as “exit terms,” “cancellation rights,” or “conditions for ending the agreement.” If a lawyer searches using just one phrase, there is a good chance relevant sections will be missed. That makes the process slow and unreliable, especially when dealing with hundreds of pages.

A vector database helps solve this by focusing on meaning instead of exact wording. The contract is split into smaller chunks, and each chunk is converted into an embedding that represents its context. These embeddings are stored so they can be searched efficiently later.

When a lawyer asks a question in plain English, that query is also converted into an embedding. The system then compares it with stored embeddings and retrieves the closest matches. This allows it to find relevant sections even if the wording is completely different.

Overall, this approach makes search more accurate and practical. Lawyers can ask questions naturally and get precise results without digging through the entire document.