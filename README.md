# Shell Scripts for a Modern, Developer-Friendly Linux Desktop

The most interesting thing here is a collection of tiny, laser-focused shell commands that remove friction from everyday developer workflows, especially around sharing and refining code snippets. These tools help you stay in the flow without ever leaving your keyboard.

## Why This Exists

1. **Faster Collaboration:** Copy and paste text or code for team members (or AI models) without fiddling with your mouse or GUI clipboards.
2. **Unix Philosophy:** Chain them together with pipes for composable workflows.
3. **Two-Layer API Design:**
   - **Interface Layer:** Ergonomic, minimal keystrokes, mnemonic command names—so you can think fast and type even faster.
   - **Implementation Layer:** Handles the nitty-gritty. Small, atomic parts so I can iterate quickly on implementation details.

## Highlights

### Visualize repo structure without noisy distractions

Let's say your project looks like this:

   ```bash
   $ rtree
   .
   ├── adapters.py
   ├── config-example.yaml
   ├── config_loader.py
   ├── domain.py
   ├── logger_factory.py
   ├── main.py
   ├── ports.py
   ├── services.py
   └── tests
       └── test_ingestion.py
   ```

### Extract the files you want, format them nicely, and copy to your clipboard, all with a single shell command

Use `-e PATTERN` for includes and `-v PATTERN` for excludes. For example, `wlcr -e config -v loader` to get all files matching "config" and not matching "loader", wrapping each one in a nice code block. Paste anywhere with the usual ctrl-V.

   ```
      config-example.yaml:

      ```yaml
      model_name: "ViT-B-32"
      device: "cuda"
      weaviate_url: "http://localhost:8080"
      index_name: "ImageEmbedding"
      collision_log: "/path/to/collisions.log"
      rejected_dir: "/path/to/rejected"
      ingested_dir: "/path/to/ingested"
      duplicates_dir: "/path/to/duplicates"
      images_dir: "/path/to/images"
      ```
   ```
