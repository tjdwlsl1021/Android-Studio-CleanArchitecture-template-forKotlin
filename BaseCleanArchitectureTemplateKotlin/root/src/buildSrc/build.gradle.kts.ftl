plugins {
    `kotlin-dsl`
}

repositories {
    maven(url = "https://plugins.gradle.org/m2/")
    google()
    mavenCentral()
    jcenter()
}

dependencies {
implementation("com.android.tools.build:gradle:3.5.3")
implementation("org.jetbrains.kotlin:kotlin-gradle-plugin:1.3.61")
implementation("de.mannodermaus.gradle.plugins:android-junit5:1.4.2.1")
}