/******************************************************************************
 * Spine Runtimes License Agreement
 * Last updated May 1, 2019. Replaces all prior versions.
 *
 * Copyright (c) 2013-2019, Esoteric Software LLC
 *
 * Integration of the Spine Runtimes into software or otherwise creating
 * derivative works of the Spine Runtimes is permitted under the terms and
 * conditions of Section 2 of the Spine Editor License Agreement:
 * http://esotericsoftware.com/spine-editor-license
 *
 * Otherwise, it is permitted to integrate the Spine Runtimes into software
 * or otherwise create derivative works of the Spine Runtimes (collectively,
 * "Products"), provided that each user of the Products must obtain their own
 * Spine Editor license and redistribution of the Products in any form must
 * include this license and copyright notice.
 *
 * THIS SOFTWARE IS PROVIDED BY ESOTERIC SOFTWARE LLC "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
 * NO EVENT SHALL ESOTERIC SOFTWARE LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES, BUSINESS
 * INTERRUPTION, OR LOSS OF USE, DATA, OR PROFITS) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *****************************************************************************/

package spine {
	import spine.animation.Animation;

	public class SkeletonData {
		/** May be null. */
		public var name : String;
		public var bones : Vector.<BoneData> = new Vector.<BoneData>(); // Ordered parents first.
		public var slots : Vector.<SlotData> = new Vector.<SlotData>(); // Setup pose draw order.
		public var skins : Vector.<Skin> = new Vector.<Skin>();
		public var defaultSkin : Skin;
		public var events : Vector.<EventData> = new Vector.<EventData>();
		public var animations : Vector.<Animation> = new Vector.<Animation>();
		public var ikConstraints : Vector.<IkConstraintData> = new Vector.<IkConstraintData>();
		public var transformConstraints : Vector.<TransformConstraintData> = new Vector.<TransformConstraintData>();
		public var pathConstraints : Vector.<PathConstraintData> = new Vector.<PathConstraintData>();
		public var x : Number, y : Number, width : Number, height : Number;
		public var version : String, hash : String;
		public var fps : Number;
		public var imagesPath : String;
		public var audioPath : String;

		public function SkeletonData() {
		}

		// --- Bones.
		/** @return May be null. */
		public function findBone(boneName : String) : BoneData {
			if (boneName == null) throw new ArgumentError("boneName cannot be null.");
			for (var i : int = 0, n : int = bones.length; i < n; i++) {
				var bone : BoneData = bones[i];
				if (bone._name == boneName) return bone;
			}
			return null;
		}

		/** @return -1 if the bone was not found. */
		public function findBoneIndex(boneName : String) : int {
			if (boneName == null) throw new ArgumentError("boneName cannot be null.");
			for (var i : int = 0, n : int = bones.length; i < n; i++)
				if (bones[i]._name == boneName) return i;
			return -1;
		}

		// --- Slots.
		/** @return May be null. */
		public function findSlot(slotName : String) : SlotData {
			if (slotName == null) throw new ArgumentError("slotName cannot be null.");
			for (var i : int = 0, n : int = slots.length; i < n; i++) {
				var slot : SlotData = slots[i];
				if (slot._name == slotName) return slot;
			}
			return null;
		}

		/** @return -1 if the bone was not found. */
		public function findSlotIndex(slotName : String) : int {
			if (slotName == null) throw new ArgumentError("slotName cannot be null.");
			for (var i : int = 0, n : int = slots.length; i < n; i++)
				if (slots[i]._name == slotName) return i;
			return -1;
		}

		// --- Skins.
		/** @return May be null. */
		public function findSkin(skinName : String) : Skin {
			if (skinName == null) throw new ArgumentError("skinName cannot be null.");
			for each (var skin : Skin in skins)
				if (skin._name == skinName) return skin;
			return null;
		}

		// --- Events.
		/** @return May be null. */
		public function findEvent(eventName : String) : EventData {
			if (eventName == null) throw new ArgumentError("eventName cannot be null.");
			for each (var eventData : EventData in events)
				if (eventData._name == eventName) return eventData;
			return null;
		}

		// --- Animations.
		/** @return May be null. */
		public function findAnimation(animationName : String) : Animation {
			if (animationName == null) throw new ArgumentError("animationName cannot be null.");
			for each (var animation : Animation in animations)
				if (animation.name == animationName) return animation;
			return null;
		}

		// --- IK constraints.
		/** @return May be null. */
		public function findIkConstraint(constraintName : String) : IkConstraintData {
			if (constraintName == null) throw new ArgumentError("constraintName cannot be null.");
			for each (var ikConstraintData : IkConstraintData in ikConstraints)
				if (ikConstraintData.name == constraintName) return ikConstraintData;
			return null;
		}

		// --- Transform constraints.
		/** @return May be null. */
		public function findTransformConstraint(constraintName : String) : TransformConstraintData {
			if (constraintName == null) throw new ArgumentError("constraintName cannot be null.");
			for each (var transformConstraintData : TransformConstraintData in transformConstraints)
				if (transformConstraintData.name == constraintName) return transformConstraintData;
			return null;
		}

		/** @return -1 if the transform constraint was not found. */
		public function findTransformConstraintIndex(transformConstraintName : String) : int {
			if (transformConstraintName == null) throw new ArgumentError("transformConstraintName cannot be null.");
			var transformConstraints : Vector.<TransformConstraintData> = this.transformConstraints;
			for (var i : int = 0, n : int = transformConstraints.length; i < n; i++)
				if (transformConstraints[i].name == transformConstraintName) return i;
			return -1;
		}

		// --- Path constraints.
		/** @return May be null. */
		public function findPathConstraint(constraintName : String) : PathConstraintData {
			if (constraintName == null) throw new ArgumentError("constraintName cannot be null.");
			var pathConstraints : Vector.<PathConstraintData> = this.pathConstraints;
			for (var i : int = 0, n : int = pathConstraints.length; i < n; i++) {
				var constraint : PathConstraintData = pathConstraints[i];
				if (constraint.name == constraintName) return constraint;
			}
			return null;
		}

		/** @return -1 if the path constraint was not found. */
		public function findPathConstraintIndex(pathConstraintName : String) : int {
			if (pathConstraintName == null) throw new ArgumentError("pathConstraintName cannot be null.");
			var pathConstraints : Vector.<PathConstraintData> = this.pathConstraints;
			for (var i : int = 0, n : int = pathConstraints.length; i < n; i++)
				if (pathConstraints[i].name == pathConstraintName) return i;
			return -1;
		}

		// ---
		public function toString() : String {
			return name != null ? name : super.toString();
		}
	}
}
