const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.
plugins.
append(
    'Provide',
    new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery'
    })
)

const path = require('path')
environment.config.merge({
    resolve: {
        alias: {
            './themes': path.resolve(__dirname, '../../app/javascript/dist/themes'),
            'semantic': path.resolve(__dirname, '../../app/javascript/dist')
        }
    }
})