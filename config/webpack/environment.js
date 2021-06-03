const { environment } = require('@rails/webpacker')
const { default: Popper } = require('popper.js')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: 'popper.js'
    })
)

module.exports = environment
