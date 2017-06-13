package ${packageName}.utils.commons

import io.reactivex.observers.DisposableObserver

class DefaultDisposableObserver<T>: DisposableObserver<T>() {
    override fun onNext(t: T) {
        //no-op
    }

    override fun onError(e: Throwable?) {
        //no-op
    }

    override fun onComplete() {
        //no-op
    }
}
