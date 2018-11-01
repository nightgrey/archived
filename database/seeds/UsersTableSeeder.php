<?php

use Illuminate\Database\Seeder;
use App\User;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Let's truncate our existing records to start from scratch.
        User::truncate();

        $faker = \Faker\Factory::create();

        // Password for all users
        $password = Hash::make('switcher.gg');

        // Administrator
        User::create([
            'username' => 'admin',
            'email' => 'admin@switcher.gg',
            'email_verified_at' => $faker->unixTime,
            'password' => $password,
            'avatar' => $faker->imageUrl($width = 100, $height = 100),
            'nintendo_friend_code' => $faker->numerify('####-####-####'),
            'discord_tag' => $faker->userName,
            'games' => 'Relation to games',
            'local_range' => $faker->numberBetween($min = 1, $max = 100),
            'bio' => $faker->text,
            'age' => $faker->numberBetween($min = 14, $max = 100),
            'use_voice_chat' => $faker->boolean,
        ]);

        // And now, let's create a few users in our database:
        for ($i = 0; $i < 50; $i++) {
            User::create([
                'username' => $faker->userName,
                'email' => $faker->email,
                'email_verified_at' => $faker->unixTime,
                'password' => $password,
                'avatar' => $faker->imageUrl($width = 100, $height = 100),
                'nintendo_friend_code' => $faker->numerify('####-####-####'),
                'discord_tag' => $faker->userName,
                'games' => 'Relation to games',
                'local_range' => $faker->numberBetween($min = 1, $max = 100),
                'bio' => $faker->text,
                'age' => $faker->numberBetween($min = 14, $max = 100),
                'use_voice_chat' => $faker->boolean,
            ]);
        }
    }
}
