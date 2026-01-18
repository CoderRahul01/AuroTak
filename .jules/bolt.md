## 2024-05-22 - Avoid Synchronous Database Access in Build Methods
**Learning:** Fetching data from Hive (or any database) inside the `build()` method causes unnecessary re-fetches and performance degradation on every rebuild.
**Action:** Move data fetching logic to `initState` (for stateful widgets) or use `FutureBuilder`/`StreamBuilder` to handle data loading asynchronously and efficiently. Even if Hive access is synchronous, operations like `toList()` and `sort()` on large datasets should not be in the build loop.
