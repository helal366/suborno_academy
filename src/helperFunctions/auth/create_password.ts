const lowercase = "abcdefghijkmnpqsrstuvwxyz";
const uppercase = "ABCDEFGHJKLNMPQRSTUVWXYZ";
const numbers = "23456789"; 
const special = "@#$*"; 
const allCharacters = lowercase + uppercase + numbers + special;

export const createPassword=async()=>{
    const guaranteed=[
        lowercase[Math.floor(Math.random()*lowercase.length)],
        uppercase[Math.floor(Math.random()*uppercase.length)],
        numbers[Math.floor(Math.random()*numbers.length)],
        special[Math.floor(Math.random()*special.length)]
    ];
    const randomTwo = [];
    for(let i=0; i<2; i++){
        const index = Math.floor(Math.random()*allCharacters.length)
        randomTwo.push(allCharacters[index])
    };
    const password = [...guaranteed, ...randomTwo];
    for(let i=5; i>0; i--){
        const j = Math.floor(Math.random()*(i+1));
        [password[i], password[j]]=[password[j], password[i]];
    }
    return password;
}