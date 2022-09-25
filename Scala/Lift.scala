
import scala.reflect.Manifest

import java.util.concurrent.atomic.AtomicInteger
import net.liftweb.actor.{LiftActor, LAFuture}

class LiftRulesJBridge {
  def liftRules: LiftRules = LiftRules
}

sealed trait LiftRulesMocker