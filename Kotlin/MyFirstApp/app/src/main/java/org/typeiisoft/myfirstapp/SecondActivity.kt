package org.typeiisoft.myfirstapp

import android.support.v7.app.AppCompatActivity
import android.os.Bundle

import kotlinx.android.synthetic.main.activity_second.textView_label
import kotlinx.android.synthetic.main.activity_second.textview_random
import java.util.*

class SecondActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        showRandomNumber()
    }

    companion object {
        const val TOTAL_COUNT = "total_count"
    }

    fun showRandomNumber() {
        // Get count from the intent extras
        val count: Int = intent.getIntExtra(TOTAL_COUNT, 0)

        // Generate the random number
        val random = Random()
        var randomInt = 0
        // Add 1 because the bound is exclusive
        if (count > 0) {
            randomInt = random.nextInt(count + 1)
        }

        // Display the random number
        textview_random.text = randomInt.toString()

        // Substitute the max value into the string resource for the heading
        // and update the heading
        textView_label.text = getString(R.string.random_heading, count)
    }
}
