const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
}))

environment.loaders.append('jquery', {
    test: require.resolve('jquery'),
    use: [{
        loader: 'expose-loader',
        options: '$',
    }, {
        loader: 'expose-loader',
        options: 'jQuery',
    }],
})

module.exports = environment
