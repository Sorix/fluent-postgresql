// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "FluentPostgreSQL",
    products: [
        // Swift ORM for PostgreSQL (built on top of Fluent ORM framework)
        .library(name: "FluentPostgreSQL", targets: ["FluentPostgreSQL"]),
    ],
    dependencies: [
        // 🌎 Utility package containing tools for byte manipulation, Codable, OS APIs, and debugging.
        .package(url: "https://github.com/vapor/core.git", from: "3.0.0"),

        // Swift ORM framework (queries, models, and relations) for building NoSQL and SQL database integrations.
        .package(url: "https://github.com/vapor/fluent.git", from: "3.0.0-rc"),

        // 🐘 Non-blocking, event-driven Swift client for PostgreSQL.
		// Temporary GIT while https://github.com/vapor/postgresql/pull/66 is being reviewed.
		.package(url: "https://github.com/Sorix/postgresql/tree/fix_jsonb", .branch("fix_jsonb")),
    ],
    targets: [
        .target(name: "FluentPostgreSQL", dependencies: ["Async", "Fluent", "FluentSQL", "PostgreSQL"]),
        .testTarget(name: "FluentPostgreSQLTests", dependencies: ["FluentBenchmark", "FluentPostgreSQL"]),
    ]
)
