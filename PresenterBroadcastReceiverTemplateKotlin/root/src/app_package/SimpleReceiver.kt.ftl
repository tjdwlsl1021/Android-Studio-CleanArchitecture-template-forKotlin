package ${packageName}

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

import javax.inject.Inject

class ${receiverName} : BroadcastReceiver(), ${contractName}.View {
    @Inject lateinit var presenter:${presenterName}

    override fun onReceive(context: Context?, intent: Intent?) {
        /* FIXME 1st:MUST add below method to RootComponent */
        // fun new${componentName}(module: ${moduleName}): ${componentName}

        /* FIXME 2nd:initialize ${componentName} like this */
        (context!!.applicationContext as MainApplication).rootComponent
        .new${componentName}(${moduleName}(this)).inject(this)
    }

     //FIXME Don't forget call this method on exit
     //presenter.dispose()
}
