import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .feature(
        interface: .Main,
        factory: .init(
            dependencies: [
                .dependencyInjection,
                .SPM.FlexLayout
            ]
        )
    ),
    .feature(
        implements: .Main,
        factory: .init(
            dependencies: [
                .feature(interface: .Main)
            ]
        )
    ),
    .feature(
        testing: .Main,
        factory: .init(
            dependencies: [
                .feature(interface: .Main)
            ]
        )
    ),
    .feature(
        tests: .Main,
        factory: .init(
            dependencies: [
                .feature(testing: .Main)
            ]
        )
    ),
    .feature(
        example: .Main,
        factory: .init(
            dependencies: [
                .feature(interface: .Main)
            ]
        )
    )
]

let project = Project.makeModule(
    name: ModulePath.Feature.name + ModulePath.Feature.Main.rawValue,
    packages: [
        .remote(url: "https://github.com/layoutBox/FlexLayout", requirement: .upToNextMajor(from: "2.0.7"))
    ],
    targets: targets
)
