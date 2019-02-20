#!/usr/bin/node

const util = require('util')
const exec = util.promisify(require('child_process').exec)

// https://github.com/srcery-colors/srcery-vim
const BLACK = '#1C1B19'
const RED = '#EF2F27'
const GREEN = '#519F50'
const YELLOW = '#FBB829'
const BLUE = '#2C78BF'
const MAGENTA = '#E02C6D'
const CYAN = '#0AAEB3'
const WHITE = '#918175'
const BRIGHTBLACK = '#2D2C29'
const BRIGHTRED = '#F75341'
const BRIGHTGREEN = '#98BC37'
const BRIGHTYELLOW = '#FED06E'
const BRIGHTBLUE = '#68A8E4'
const BRIGHTMAGENTA = '#FF5C8F'
const BRIGHTCYAN = '#53FDE9'
const BRIGHTWHITE = '#FCE8C3'

process.stdout.write('{"version":1}\n[\n')
process.stdout.write('[]')

async function loop() {
    const output = []
    const now = new Date()


    // --------- Song ---------
    //
    try {
        const songStatus = (await exec('playerctl status')).stdout.replace('\n', '')
        const songArtist = (await exec('playerctl metadata artist')).stdout.replace('\n', '')
        const songName = (await exec('playerctl metadata title')).stdout.replace('\n', '')
        output.push({
            color: BLUE,
            full_text: ` ♫ ${songStatus}: ${songName} by ${songArtist} ♫ `
        })
    } catch (error) {

    }

    // --------- Time ---------
    //
    const hours = (`${now.getHours()}`).padStart(2, 0)
    const minutes = (`${now.getMinutes()}`).padStart(2, 0)
    const seconds = (`${now.getSeconds()}`).padStart(2, 0)

    output.push({
        color: YELLOW,
        full_text: ` ${hours}:${minutes}:${seconds} `
    })

    // --------- Date ---------
    //
    const MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    const day = now.getDate()
    const month = MONTHS[now.getMonth()]
    const year = now.getFullYear()

    output.push({
        color: GREEN,
        full_text: ` ${day}-${month}-${year} `
    })

    // --------- OUTPUT ---------
    //
    process.stdout.write(',' + JSON.stringify(output))

    setTimeout(loop, 1000)
}

loop()

