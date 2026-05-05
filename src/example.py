from __future__ import annotations


def greet(name: str) -> str:
    """Return a greeting for the provided name."""
    cleaned = name.strip()
    if not cleaned:
        raise ValueError("name must not be empty")
    return f"Hello, {cleaned}!"


if __name__ == "__main__":
    print(greet("Gemini CLI"))
