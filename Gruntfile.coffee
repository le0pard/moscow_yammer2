#jshint camelcase: false

# Generated on 2014-02-28 using generator-chromeapp 0.2.5
"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->

  # show elapsed time at the end
  require("time-grunt") grunt

  # load all grunt tasks
  require("load-grunt-tasks") grunt
  grunt.initConfig
    yeoman:
      app: "app"
      dev: "dev"
      dist: "dist"

    watch:
      options:
        spawn: false

      coffee:
        files: ["<%= yeoman.app %>/scripts/**/*.{coffee,litcoffee,coffee.md}"]
        tasks: ["coffee:dev"]

      coffeeTest:
        files: ["test/spec/**/*.{coffee,litcoffee,coffee.md}"]
        tasks: ["coffee:test"]

      compass:
        files: ["<%= yeoman.app %>/styles/**/*.{scss,sass}"]
        tasks: [
          "compass:dev"
          "autoprefixer"
        ]

      styles:
        files: ["<%= yeoman.app %>/styles/**/*.css"]
        tasks: [
          "copy:styles"
          "autoprefixer"
        ]

      static:
        files: ["<%= yeoman.app %>/**/*.{html,png,ico,gif,jpg,jpeg,webp,json}"]
        tasks: ["copy:dev"]

      livereload:
        options:
          livereload: "<%= connect.livereload.options.livereload %>"

        files: [
          "<%= yeoman.app %>/*.html"
          "<%= yeoman.app %>/styles/{,*/}*.css"
          "<%= yeoman.app %>/scripts/{,*/}*.js"
          "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
          "<%= yeoman.app %>/manifest.json"
          "<%= yeoman.app %>/_locales/{,*/}*.json"
        ]

    coffee:
      dev:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/scripts"
          src: "**/*.{coffee,litcoffee,coffee.md}"
          dest: "<%= yeoman.dev %>/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "**/*.{coffee,litcoffee,coffee.md}"
          dest: "<%= yeoman.dev %>/spec"
          ext: ".js"
        ]

    autoprefixer:
      options:
        browsers: ["last 1 version"]

      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dev %>/styles/"
          src: "{,*/}*.css"
          dest: "<%= yeoman.dev %>/styles/"
        ]

    connect:
      options:
        port: 9000

        # change this to '0.0.0.0' to access the server from outside
        hostname: "localhost"

      livereload:
        options:
          livereload: 35729
          base: ["<%= yeoman.dev %>"]

      test:
        options:
          base: [
            "test"
            "<%= yeoman.dev %>"
          ]

    clean:
      dev:
        files: [
          dot: true
          src: [
            "<%= yeoman.dev %>/*"
            "!<%= yeoman.dev %>/.git*"
          ]
        ]

      dist:
        files: [
          dot: true
          src: [
            "<%= yeoman.dist %>/*"
            "!<%= yeoman.dist %>/.git*"
          ]
        ]

    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: [
        "Gruntfile.js"
        "<%= yeoman.app %>/scripts/{,*/}*.js"
        "test/spec/{,*/}*.js"
      ]

    jasmine:
      all:
        options:
          specs: "<%= yeoman.dev %>/spec/{,*/}*.js"


    # Compiles Sass to CSS and generates necessary files if requested
    compass:
      options:
        sassDir: "<%= yeoman.app %>/styles"
        cssDir: "<%= yeoman.dev %>/styles"
        generatedImagesDir: "<%= yeoman.dev %>/images/generated"
        imagesDir: "<%= yeoman.app %>/images"
        javascriptsDir: "<%= yeoman.app %>/scripts"
        fontsDir: "<%= yeoman.app %>/styles/fonts"
        importPath: "<%= yeoman.app %>/bower_components"
        httpImagesPath: "/images"
        httpGeneratedImagesPath: "/images/generated"
        httpFontsPath: "/styles/fonts"
        relativeAssets: false
        assetCacheBuster: false

      dev:
        options:
          generatedImagesDir: "<%= yeoman.dev %>/images/generated"

    useminPrepare:
      options:
        dest: "<%= yeoman.dist %>"

      html: ["<%= yeoman.dev %>/index.html"]

    usemin:
      options:
        dirs: ["<%= yeoman.dist %>"]

      html: ["<%= yeoman.dist %>/{,*/}*.html"]
      css: ["<%= yeoman.dist %>/styles/{,*/}*.css"]

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dev %>/images"
          src: "{,*/}*.{gif,jpeg,jpg,png}"
          dest: "<%= yeoman.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dev %>/images"
          src: "{,*/}*.svg"
          dest: "<%= yeoman.dist %>/images"
        ]

    htmlmin:
      dist:
        options: {}

        # removeCommentsFromCDATA: true,
        # collapseWhitespace: true,
        # collapseBooleanAttributes: true,
        # removeAttributeQuotes: true,
        # removeRedundantAttributes: true,
        # useShortDoctype: true,
        # removeEmptyAttributes: true,
        # removeOptionalTags: true
        files: [
          expand: true
          cwd: "<%= yeoman.dev %>"
          src: "*.html"
          dest: "<%= yeoman.dist %>"
        ]

    uncss:
      options:
        ignore: [/^\.js/]
      dist:
        files:
          "<%= yeoman.dist %>/styles/main.css": ["<%= yeoman.dist %>/index.html"]


    # By default, your `index.html`'s <!-- Usemin block --> will take care of
    # minification. These next options are pre-configured if you do not wish
    # to use the Usemin blocks.
    # cssmin: {
    #     dist: {
    #         files: {
    #             '<%= yeoman.dist %>/styles/main.css': [
    #                 '.tmp/styles/{,*/}*.css',
    #                 '<%= yeoman.app %>/styles/{,*/}*.css'
    #             ]
    #         }
    #     }
    # },
    # uglify: {
    #     dist: {
    #         files: {
    #             '<%= yeoman.dist %>/scripts/scripts.js': [
    #                 '<%= yeoman.dist %>/scripts/scripts.js'
    #             ]
    #         }
    #     }
    # },
    # concat: {
    #     dist: {}
    # },

    # Put files not handled in other tasks here
    copy:
      dev:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dev %>"
          src: [
            "{,*/}*.{html,json}"
            "images/{,*/}*.{webp,gif,ico,png}"
            "styles/fonts/{,*/}*.*"
            "styles/{,*/}*.css"
            "scripts/{,*/}*.js"
            "_locales/{,*/}*.json"
          ]
        ]

      styles:
        expand: true
        dot: true
        cwd: "<%= yeoman.app %>/styles"
        dest: "<%= yeoman.dev %>/styles/"
        src: "{,*/}*.css"

      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.dev %>"
          dest: "<%= yeoman.dist %>"
          src: [
            "*.{ico,png,txt}"
            "images/{,*/}*.{webp,gif}"
            "_locales/{,*/}*.json"
            "styles/fonts/{,*/}*.*"
          ]
        ]

    concurrent:
      dist: [
        "imagemin"
        "svgmin"
        "htmlmin"
      ]

    rev:
      dist:
        files:
          src: [
            "<%= yeoman.dist %>/scripts/{,*/}*.js"
            "<%= yeoman.dist %>/styles/{,*/}*.css"
            #"<%= yeoman.dist %>/images/{,*/}*.{gif,jpeg,jpg,png,webp}"
            #"<%= yeoman.dist %>/fonts/{,*/}*.*"
          ]

    chromeManifest:
      dist:
        options:
          buildnumber: true
          background:
            target: "scripts/background.js"
            exclude: ["scripts/chromereload.js"]

        src: "<%= yeoman.dev %>"
        dest: "<%= yeoman.dist %>"

    compress:
      dist:
        options:
          archive: "package/moscow_yammer.zip"

        files: [
          expand: true
          cwd: "dist/"
          src: ["**"]
          dest: ""
        ]

  grunt.registerTask "dev", [
    "clean:dev"
    "copy:dev"
    "coffee:dev"
    "compass:dev"
    "autoprefixer"
    "jshint"
  ]

  grunt.registerTask "debug", (opt) ->
    if opt and opt is "jshint"
      watch = grunt.config("watch")
      watch.livereload.tasks.push "jshint"
      grunt.config "watch", watch

    grunt.task.run [
      "dev"
      "connect:livereload"
      "watch"
    ]

  grunt.registerTask "test", [
    "coffee:test"
    "connect:test"
    "jasmine"
  ]
  grunt.registerTask "build", [
    "dev"
    "clean:dist"
    "chromeManifest:dist"
    "useminPrepare"
    "concurrent:dist"
    "copy:dist"
    "concat"
    "uncss"
    "cssmin"
    "uglify"
    "rev"
    "usemin"
    "compress"
  ]
  grunt.registerTask "default", [
    "test"
    "build"
  ]