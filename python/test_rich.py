from rich.console import Console
from rich.table import Table
from rich.progress import Progress
from rich.logging import RichHandler
from rich.markdown import Markdown
import logging
import time

console = Console()

table = Table(title="Demo Table")

table.add_column("Name", justify="left", style="cyan", no_wrap=True)
table.add_column("Age", justify="right", style="magenta")
table.add_column("City", justify="center", style="green")

table.add_row("Alice", "24", "New York")
table.add_row("Bob", "30", "San Francisco")
table.add_row("Charlie", "28", "Chicago")

console.print(table)

console.print("Hello, [bold magenta]World![/bold magenta]", style="green")

with Progress() as progress:
    task = progress.add_task("[cyan]Processing...", total=100)
    for i in range(100):
        time.sleep(0.1)
        progress.update(task, advance=1)

logging.basicConfig(
    level=logging.INFO,
    format="%(message)s",
    handlers=[RichHandler(console=console)],
)

log = logging.getLogger("rich")
log.info("This is an info log")
log.warning("This is a warning log")
log.error("This is an error log")

markdown = Markdown("""
# Title
## Subtitle
This is **bold** text and *italic* text.
- List item 1
- List item 2
""")
console.print(markdown)
